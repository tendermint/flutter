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
  }) : super(key: key);

  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double height;
  final double? contentPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: CosmosTheme.of(context).borderRadiusM),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(width: contentPadding ?? CosmosTheme.of(context).spacingS),
          ],
          Text(
            text,
            style: CosmosTextTheme.elevatedButton,
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: contentPadding ?? CosmosTheme.of(context).spacingS),
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
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
