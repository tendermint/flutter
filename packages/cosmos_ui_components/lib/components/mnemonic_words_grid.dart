import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicWordsGrid extends StatelessWidget {
  const CosmosMnemonicWordsGrid({
    required this.mnemonicWords,
    this.showIndices = true,
    this.physics,
    this.onTapWord,
    this.itemStyle,
    Key? key,
  }) : super(key: key);

  final List<String> mnemonicWords;
  final ScrollPhysics? physics;
  final bool showIndices;
  final void Function(int index)? onTapWord;
  final MnemonicChoiceChipStyle Function(int index)? itemStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: CosmosTheme.of(context).spacingM,
      runSpacing: CosmosTheme.of(context).spacingM,
      children: mnemonicWords //
          .mapIndexed(
            (index, word) => MnemonicChoiceChip(
              style: itemStyle?.call(index),
              index: index,
              word: word,
              showIndex: showIndices,
              onTap: onTapWord == null ? null : () => onTapWord!.call(index),
            ),
          )
          .toList(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function(int index)?>.has('onTapWord', onTapWord))
      ..add(IterableProperty<String>('mnemonicWords', mnemonicWords))
      ..add(DiagnosticsProperty<ScrollPhysics?>('physics', physics))
      ..add(ObjectFlagProperty<MnemonicChoiceChipStyle Function(int index)?>.has('itemStyle', itemStyle))
      ..add(DiagnosticsProperty<bool>('showIndices', showIndices));
  }
}
