import 'dart:math';

import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/generated_assets/assets.gen.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicConfirmView extends StatefulWidget {
  const CosmosMnemonicConfirmView({
    required this.mnemonicWords,
    required this.onSelectedWordsChanged,
    this.invalidOrderText = 'Invalid order',
    Key? key,
  }) : super(key: key);

  final List<String> mnemonicWords;
  final void Function(List<String> selectedWords) onSelectedWordsChanged;
  final String invalidOrderText;

  @override
  State<CosmosMnemonicConfirmView> createState() => _CosmosMnemonicConfirmViewState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('mnemonicWords', mnemonicWords))
      ..add(
        ObjectFlagProperty<void Function(List<String> selectedWords)>.has(
          'onSelectedWordsChanged',
          onSelectedWordsChanged,
        ),
      )
      ..add(StringProperty('invalidOrderText', invalidOrderText));
  }
}

class _CosmosMnemonicConfirmViewState extends State<CosmosMnemonicConfirmView> {
  late List<String> _shuffledWords;
  final _usedWords = <String>[];

  bool get _showInvalidOrderError =>
      widget.mnemonicWords.length == _usedWords.length && !listEquals(_usedWords, widget.mnemonicWords);

  @override
  void initState() {
    super.initState();
    _shuffledWords = [...widget.mnemonicWords]..shuffle(Random());
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: CosmosTheme.of(context).borderRadiusL,
            border: Border.all(
              color: CosmosTheme.of(context).colors.chipBackground,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(CosmosTheme.of(context).spacingM),
            child: AnimatedSize(
              alignment: Alignment.topLeft,
              duration: const ShortDuration(),
              child: Stack(
                children: [
                  Align(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        minWidth: double.infinity,
                        minHeight: 40,
                      ),
                      child: Column(
                        children: [
                          CosmosMnemonicWordsGrid(
                            itemStyle: (_) => MnemonicChoiceChipStyle(
                              backgroundColor: theme.colors.text,
                              textColor: theme.colors.background,
                              indexBackgroundColor: theme.colors.background,
                              indexTextColor: theme.colors.text,
                            ),
                            mnemonicWords: _usedWords,
                            onTapWord: (index) => setState(
                              () {
                                _usedWords.removeAt(index);
                                widget.onSelectedWordsChanged([..._usedWords]);
                              },
                            ),
                          ),
                          if (_showInvalidOrderError) _invalidIndicator(context),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: CosmosTheme.of(context).spacingL),
        _AvailableWordsGrid(
          mnemonicWords: _shuffledWords,
          usedWords: _usedWords,
          onTapWord: (word) => setState(() {
            _usedWords.add(word);
            widget.onSelectedWordsChanged([..._usedWords]);
          }),
        ),
      ],
    );
  }

  Widget _invalidIndicator(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: theme.spacingL, bottom: theme.spacingM),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Assets.images.iconInvalid.path, package: packageName),
          SizedBox(width: theme.spacingM),
          Text(
            widget.invalidOrderText,
            style: CosmosTextTheme.labelS.copyWith(color: theme.colors.error),
          )
        ],
      ),
    );
  }
}

class _AvailableWordsGrid extends StatelessWidget {
  const _AvailableWordsGrid({
    required this.mnemonicWords,
    required this.usedWords,
    required this.onTapWord,
    Key? key,
  }) : super(key: key);

  final List<String> usedWords;
  final List<String> mnemonicWords;
  final void Function(String) onTapWord;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: CosmosTheme.of(context).spacingM,
      runSpacing: CosmosTheme.of(context).spacingM,
      children: mnemonicWords.mapIndexed(
        (index, word) {
          final used = usedWords.contains(word);

          return MnemonicChoiceChip(
            showIndex: false,
            index: index,
            onTap: used ? null : () => onTapWord(word),
            word: word,
            style: MnemonicChoiceChipStyle(
              dottedBorder: used,
              backgroundColor: Colors.transparent,
              textColor: used ? Colors.transparent : null,
              borderColor: CosmosTheme.of(context).colors.text,
              borderWidth: 1,
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<String>('mnemonicWords', mnemonicWords))
      ..add(IterableProperty<String>('usedWords', usedWords))
      ..add(ObjectFlagProperty<void Function(String p1)>.has('onTapWord', onTapWord));
  }
}
