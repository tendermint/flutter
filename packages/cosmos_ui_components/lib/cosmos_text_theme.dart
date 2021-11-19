import 'package:flutter/cupertino.dart';

abstract class CosmosTextTheme {
  static const String fontInter = "Inter";

  static TextStyle get title2Bold => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        height: 1.27,
      );

  static TextStyle get copy0Normal => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.625,
      );

  static TextStyle get copyMinus1Normal => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w400,
        fontSize: 13,
        height: 1.645,
      );

  static TextStyle get elevatedButton => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w500,
        fontSize: 16,
      );

  static TextStyle get titleSans2Bold => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      );

  factory CosmosTextTheme._() => throw UnsupportedError("Not meant to be instantiated");
}
