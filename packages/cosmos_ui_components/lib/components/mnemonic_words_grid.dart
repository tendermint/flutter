import 'package:cosmos_ui_components/components/mnemonic_choice_chip.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicWordsGrid extends StatelessWidget {
  final List<String> mnemonicWords;
  final ScrollPhysics? physics;
  final bool showIndices;
  final void Function(int index)? onTapWord;

  const CosmosMnemonicWordsGrid({
    Key? key,
    required this.mnemonicWords,
    this.showIndices = true,
    this.physics,
    this.onTapWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      physics: physics,
      maxCrossAxisExtent: 150,
      shrinkWrap: true,
      childAspectRatio: 3,
      children: mnemonicWords //
          .mapIndexed((index, word) => Padding(
                padding: const EdgeInsets.only(
                  top: CosmosAppTheme.spacingS,
                  left: CosmosAppTheme.spacingS,
                ),
                child: MnemonicChoiceChip(
                  index: index,
                  word: word,
                  showIndex: showIndices,
                  onTap: onTapWord == null ? null : () => onTapWord!.call(index),
                ),
              ))
          .toList(),
    );
  }
}
