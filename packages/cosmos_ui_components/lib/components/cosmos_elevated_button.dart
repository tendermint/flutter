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
    final secondaryColor = Theme.of(context).colorScheme.secondary;
    final primaryColor = Theme.of(context).colorScheme.primary;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        primary: outlined ? primaryColor : secondaryColor,
        onPrimary: outlined ? secondaryColor : primaryColor,
        side: BorderSide(
          color: outlined ? secondaryColor : primaryColor,
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
