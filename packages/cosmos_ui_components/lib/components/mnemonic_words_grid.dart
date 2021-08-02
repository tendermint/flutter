import 'package:cosmos_ui_components/components/mnemonic_choice_chip.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosMnemonicWordsGrid extends StatelessWidget {
  final List<String> mnemonicWords;

  const CosmosMnemonicWordsGrid({
    Key? key,
    required this.mnemonicWords,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: (MediaQuery.of(context).size.width * 0.005).ceil(),
      shrinkWrap: true,
      childAspectRatio: 5,
      children: mnemonicWords //
          .mapIndexed((index, word) => MnemonicChoiceChip(index: index, word: word))
          .toList(),
    );
  }
}
