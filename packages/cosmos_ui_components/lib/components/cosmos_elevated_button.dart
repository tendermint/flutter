import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/utils/global_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosElevatedButton extends StatelessWidget {
  const CosmosElevatedButton({
    Key? key,
    this.onTap,
    this.text = '',
    this.suffixIcon,
    this.prefixIcon,
    this.height = GlobalConstants.defaultButtonHeight,
    this.contentPadding,
    this.elevation,
    this.backgroundColor,
    this.textColor,
    this.shadowColor,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double height;
  final double? contentPadding;
  final double? elevation;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        onPrimary: backgroundColor ?? theme.colors.background,
        primary: textColor ?? theme.colors.text,
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: theme.borderRadiusM),
        elevation: elevation ?? 0,
        shadowColor: shadowColor ?? theme.colors.shadowColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(width: contentPadding ?? theme.spacingS),
          ],
          Text(
            text,
            style: CosmosTextTheme.elevatedButton,
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: contentPadding ?? theme.spacingS),
            suffixIcon!,
          ],
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('contentPadding', contentPadding))
      ..add(DoubleProperty('height', height))
      ..add(StringProperty('text', text))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(DoubleProperty('elevation', elevation))
      ..add(ColorProperty('textColor', textColor))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('shadowColor', shadowColor));
  }
}
