import 'package:cosmos_ui_components/components/cosmos_text_button.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;

  const CosmosBackButton({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CosmosTextButton(
      onTap: onTap ?? () => Navigator.of(context).pop(),
      text: text ?? "",
      iconTopSpacing: 2,
      leadingIcon: Image.asset(
        "assets/images/big-arrow-left.png",
        package: "cosmos_ui_components",
        width: 32,
        height: 32,
        scale: 1,
        color: CosmosTheme.of(context).colors.onBackground,
      ),
    );
  }
}
