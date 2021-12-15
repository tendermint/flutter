import 'package:flutter/cupertino.dart';

abstract class CosmosTextTheme {
  factory CosmosTextTheme._() => throw UnsupportedError('Not meant to be instantiated');

  static const String fontInter = 'Inter';

  static TextStyle get title0Bold => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        height: 1.3,
      );

  static TextStyle get title1Bold => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w700,
        fontSize: 21,
        height: 1.29,
      );

  static TextStyle get title2Bold => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w700,
        fontSize: 28,
        height: 1.27,
      );

  static TextStyle get titleS => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        fontSize: 13,
        height: 1.23,
      );

  static TextStyle get title1Medium => const TextStyle(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w600,
        fontSize: 21,
        height: 1.287,
      );

  static TextStyle get title0Medium => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w600,
        fontSize: 16,
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

  static TextStyle get titleSans0Normal => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.3,
      );

  static TextStyle get titleSans2Bold => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      );

  static TextStyle get actionSheetItem => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w400,
        fontSize: 20,
      );

  static TextStyle get smallCaption => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w600,
        fontSize: 8,
        height: 1.31,
      );

  static TextStyle get labelS => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w600,
        fontSize: 13,
        height: 1.23,
      );

  static TextStyle get labelL => const TextStyle(
        fontFamily: fontInter,
        fontWeight: FontWeight.w600,
        fontSize: 21,
        height: 1.52,
      );

  static TextStyle get headingM => const TextStyle(
    fontFamily: fontInter,
    fontWeight: FontWeight.w700,
    fontSize: 38,
    height: 1.26,
  );
}
