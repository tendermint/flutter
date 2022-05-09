import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosTextButton extends StatelessWidget {
  const CosmosTextButton({
    Key? key,
    this.onTap,
    this.text = '',
    this.suffixIcon,
    this.leadingIcon,
    this.height = defaultHeight,
    this.textStyle,
    this.iconTopSpacing,
    this.color,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  static const defaultHeight = 50.0;

  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final Widget? leadingIcon;
  final double height;
  final TextStyle? textStyle;
  final Color? color;
  final double? iconTopSpacing;
  final int maxLines;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: theme.borderRadiusM),
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
            if (text.isNotEmpty) SizedBox(width: theme.spacingM),
          ],
          Text(
            text,
            maxLines: maxLines,
            overflow: overflow,
            style: textStyle ??
                CosmosTextTheme.elevatedButton.copyWith(
                  color: color ?? theme.colors.text,
                ),
          ),
          if (suffixIcon != null) ...[
            if (text.isNotEmpty) SizedBox(width: theme.spacingS),
            Padding(
              padding: EdgeInsets.only(top: iconTopSpacing ?? 0.0),
              child: suffixIcon,
            ),
          ],
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('iconTopSpacing', iconTopSpacing))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(ColorProperty('color', color))
      ..add(StringProperty('text', text))
      ..add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle))
      ..add(DoubleProperty('height', height))
      ..add(IntProperty('maxLines', maxLines))
      ..add(EnumProperty<TextOverflow>('overflow', overflow));
  }
}
