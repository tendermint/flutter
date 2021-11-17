import 'package:flutter/material.dart';
import 'package:string_to_hex/string_to_hex.dart';

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

  List<Color> generateColorsFromAddress(String address) {
    final color1 = StringBuffer();
    final color2 = StringBuffer();

    color1.write('#');
    color2.write('#');

    // Initialised it here because linter was warning me not to declare multiple variables in single line
    var j = address.length - 7;
    for (var i = address.length - 1; color1.length <= 7 && color2.length <= 7; i--, j--) {
      color1.write(address[i]);
      color2.write(address[j]);
    }

    return [
      Color(StringToHex.toColor(color1.toString())),
      Color(StringToHex.toColor(color2.toString())),
    ];
  }
}
