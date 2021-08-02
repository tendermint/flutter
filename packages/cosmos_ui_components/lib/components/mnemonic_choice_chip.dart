import 'package:flutter/material.dart';

class MnemonicChoiceChip extends StatelessWidget {
  final int index;
  final String word;

  const MnemonicChoiceChip({
    Key? key,
    required this.index,
    required this.word,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(word),
      selected: true,
      avatar: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColorLight,
        child: Text(
          "${index + 1}",
          style: const TextStyle(fontSize: 12),
        ),
      ),
      labelStyle: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      selectedColor: Theme.of(context).primaryColorDark,
    );
  }
}
