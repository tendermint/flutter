import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GradientAvatar extends StatelessWidget {
  const GradientAvatar({
    required this.stringKey,
    Key? key,
  }) : super(key: key);

  final String stringKey;

  @override
  Widget build(BuildContext context) {
    final colors = generateColorsFromAddress(stringKey);
    return CircleAvatar(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [colors[0], colors[1]]),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('stringKey', stringKey));
  }
}
