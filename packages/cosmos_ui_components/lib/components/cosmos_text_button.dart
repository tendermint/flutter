import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosTextButton extends StatelessWidget {
  static const defaultHeight = 50.0;
  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final double height;

  const CosmosTextButton({
    Key? key,
    this.onTap,
    this.text = "",
    this.suffixIcon,
    this.height = defaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: CosmosTheme.of(context).borderRadiusM),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: CosmosTextTheme.elevatedButton,
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: CosmosTheme.of(context).spacingS),
            suffixIcon!,
          ],
        ],
      ),
    );
  }
}
