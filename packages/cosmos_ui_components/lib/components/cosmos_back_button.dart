import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosBackButton extends StatelessWidget {
  const CosmosBackButton({
    Key? key,
    this.text = 'Back',
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return CosmosTextButton(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      text: text ?? '',
      iconTopSpacing: 2,
      leadingIcon: Image.asset(
        'assets/images/big-arrow-left.png',
        package: packageName,
        width: 32,
        height: 32,
        scale: 1,
        color: CosmosTheme.of(context).colors.text,
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap))
      ..add(StringProperty('text', text));
  }
}
