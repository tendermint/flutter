import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/utils/global_constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosOutlineButton extends StatelessWidget {
  const CosmosOutlineButton({
    Key? key,
    this.onTap,
    this.text = '',
    this.height = GlobalConstants.defaultButtonHeight,
    this.suffixIcon,
    this.backgroundColor,
    this.textColor,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final double height;
  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        primary: textColor ?? theme.colors.text,
        backgroundColor: backgroundColor ?? theme.colors.background,
        side: BorderSide(color: textColor ?? theme.colors.text),
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: theme.borderRadiusM),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: CosmosTextTheme.elevatedButton.copyWith(
              color: theme.colors.text,
            ),
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: theme.spacingS),
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
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(StringProperty('text', text))
      ..add(DoubleProperty('height', height))
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(ColorProperty('textColor', textColor));
  }
}
