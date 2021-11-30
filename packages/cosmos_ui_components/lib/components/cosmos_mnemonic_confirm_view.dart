import 'dart:math';

import 'package:cosmos_ui_components/components/mnemonic_words_grid.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicConfirmView extends StatefulWidget {
  final List<String> mnemonicWords;
  final void Function(List<String> selectedWords) onSelectedWordsChanged;

  const CosmosMnemonicConfirmView({
    Key? key,
    required this.mnemonicWords,
    required this.onSelectedWordsChanged,
  }) : super(key: key);

  @override
  State<CosmosMnemonicConfirmView> createState() => _CosmosMnemonicConfirmViewState();
}

class _CosmosMnemonicConfirmViewState extends State<CosmosMnemonicConfirmView> {
  late List<String> _shuffledWords;
  final _usedWords = <String>[];

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
                      child: CosmosMnemonicWordsGrid(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: CosmosTheme.of(context).spacingL,
        ),
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
}

class _AvailableWordsGrid extends StatelessWidget {
  final List<String> usedWords;
  final List<String> mnemonicWords;
  final void Function(String) onTapWord;

  const _AvailableWordsGrid({
    Key? key,
    required this.mnemonicWords,
    required this.usedWords,
    required this.onTapWord,
  }) : super(key: key);

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
}
