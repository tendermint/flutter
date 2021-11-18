import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class GradientAvatar extends StatelessWidget {
  final String stringKey;

  const GradientAvatar({Key? key, required this.stringKey}) : super(key: key);

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
}
