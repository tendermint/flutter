import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosElevatedButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final bool outlined;

  const CosmosElevatedButton({
    Key? key,
    this.onTap,
    this.text = "",
    this.suffixIcon,
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.secondary,
        onPrimary: Theme.of(context).colorScheme.onSecondary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          if (suffixIcon != null) ...[
            const SizedBox(width: CosmosAppTheme.spacingS),
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}
