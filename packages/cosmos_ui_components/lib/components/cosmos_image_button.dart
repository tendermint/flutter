import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class CosmosImageButton extends StatelessWidget {
  final String asset;
  final double height;
  final double width;
  final VoidCallback? onTap;

  const CosmosImageButton({
    Key? key,
    required this.asset,
    this.onTap,
    this.height = 24,
    this.width = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(asset, package: packageName),
      ),
    );
  }
}
