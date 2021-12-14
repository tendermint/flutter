import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosImageButton extends StatelessWidget {
  const CosmosImageButton({
    required this.asset,
    this.onTap,
    this.package,
    this.height = 24,
    this.width = 24,
    Key? key,
  }) : super(key: key);

  final String asset;
  final String? package;
  final double height;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height,
        width: width,
        child: Image.asset(asset, package: package),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DoubleProperty('width', width))
      ..add(StringProperty('asset', asset))
      ..add(DoubleProperty('height', height))
      ..add(StringProperty('package', package))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
