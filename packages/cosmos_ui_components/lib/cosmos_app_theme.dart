import 'package:flutter/material.dart';

class CosmosAppTheme {
  static const offWhite = Color(0xFFF2F2F2);

  static const spacingXL = 48.0;
  static const spacingL = 24.0;
  static const spacingM = 12.0;
  static const spacingS = 6.0;
  static const spacingXS = 2.0;

  static const longDuration = 500;
  static const mediumDuration = 300;
  static const shortDuration = 150;

  static const radiusL = 20.0;
  static const radiusM = 8.0;
  static const radiusS = 4.0;

  static const fontSizeS = 10.0;

  static const BorderRadius borderRadiusM = BorderRadius.all(Radius.circular(radiusM));
  static const BorderRadius borderRadiusS = BorderRadius.all(Radius.circular(radiusS));

  static const elevationS = 4.0;

  static ThemeData buildAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: offWhite,
      disabledColor: Colors.grey,
      dividerColor: Colors.grey,
      primarySwatch: Colors.blue,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}
