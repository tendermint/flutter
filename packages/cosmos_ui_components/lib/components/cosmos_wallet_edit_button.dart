import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosWalletEditButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CosmosWalletEditButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: SizedBox(
        height: 24,
        width: 24,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: CosmosTheme.of(context).colors.text, width: 2),
          ),
          child: CircleAvatar(
            backgroundColor: CosmosTheme.of(context).colors.background,
            foregroundColor: CosmosTheme.of(context).colors.text,
            child: const Icon(Icons.more_horiz, size: 16),
          ),
        ),
      ),
    );
  }
}
