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
    final onPrimary = Theme.of(context).colorScheme.onSecondary;
    final primary = Theme.of(context).colorScheme.secondary;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: outlined ? onPrimary : primary,
        onPrimary: outlined ? primary : onPrimary,
        side: BorderSide(
          color: outlined ? primary : onPrimary,
        ),
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
