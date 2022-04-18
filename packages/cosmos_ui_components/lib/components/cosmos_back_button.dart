import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/generated_assets/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosBackButton extends StatelessWidget {
  const CosmosBackButton({
    Key? key,
    this.text = 'Back',
    this.onTap,
    this.color,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CosmosTextButton(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      text: text ?? '',
      iconTopSpacing: 2,
      leadingIcon: Image.asset(
        Assets.images.bigArrowLeft.path,
        package: packageName,
        width: 32,
        height: 32,
        scale: 1,
        color: color ?? CosmosTheme.of(context).colors.text,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(StringProperty('text', text))
      ..add(ColorProperty('color', color));
  }
}
