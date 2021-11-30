import 'package:cosmos_ui_components/components/mnemonic_choice_chip.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicWordsGrid extends StatelessWidget {
  final List<String> mnemonicWords;
  final ScrollPhysics? physics;
  final bool showIndices;
  final void Function(int index)? onTapWord;
  final MnemonicChoiceChipStyle Function(int index)? itemStyle;

  const CosmosMnemonicWordsGrid({
    Key? key,
    required this.mnemonicWords,
    this.showIndices = true,
    this.physics,
    this.onTapWord,
    this.itemStyle,
  }) : super(key: key);

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
}
