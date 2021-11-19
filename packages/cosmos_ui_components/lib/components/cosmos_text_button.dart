import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosTextButton extends StatelessWidget {
  static const defaultHeight = 50.0;
  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final Widget? leadingIcon;
  final double height;
  final TextStyle? textStyle;
  final Color? color;
  final double? iconTopSpacing;

  const CosmosTextButton({
    Key? key,
    this.onTap,
    this.text = "",
    this.suffixIcon,
    this.leadingIcon,
    this.height = defaultHeight,
    this.textStyle,
    this.iconTopSpacing,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: CosmosTheme.of(context).borderRadiusM),
        onSurface: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingIcon != null) ...[
            Padding(
              padding: EdgeInsets.only(top: iconTopSpacing ?? 0.0),
              child: leadingIcon,
            ),
            if (text.isNotEmpty) SizedBox(width: CosmosTheme.of(context).spacingM),
          ],
          Text(
            text,
            style: textStyle ?? CosmosTextTheme.elevatedButton,
          ),
          if (suffixIcon != null) ...[
            if (text.isNotEmpty) SizedBox(width: CosmosTheme.of(context).spacingS),
            Padding(
              padding: EdgeInsets.only(top: iconTopSpacing ?? 0.0),
              child: suffixIcon,
            ),
          ],
        ],
      ),
    );
  }
}
