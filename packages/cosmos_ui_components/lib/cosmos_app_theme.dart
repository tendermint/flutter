import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: avoid_classes_with_only_static_members
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

  static const fontSizeS = 12.0;

  static const BorderRadius borderRadiusM = BorderRadius.all(Radius.circular(radiusM));
  static const BorderRadius borderRadiusS = BorderRadius.all(Radius.circular(radiusS));

  static const elevationS = 4.0;

  static ThemeData buildAppTheme() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: CosmosColors.lightBg,
        foregroundColor: CosmosColors.onLightText,
        actionsIconTheme: IconThemeData(
          color: CosmosColors.onLightText,
        ),
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: CosmosColors.onLightText,
        ),
      ),
      scaffoldBackgroundColor: CosmosColors.lightBg,
      disabledColor: CosmosColors.lightInactive,
      dividerColor: CosmosColors.lightDivider,
      colorScheme: const ColorScheme(
        primary: CosmosColors.darkBg,
        primaryVariant: CosmosColors.lightSurface,
        secondary: CosmosColors.darkBg,
        secondaryVariant: CosmosColors.lightBg,
        surface: CosmosColors.lightSurface,
        background: CosmosColors.lightBg,
        error: CosmosColors.error,
        onPrimary: CosmosColors.onDarkText,
        onSecondary: CosmosColors.onDarkText,
        onSurface: CosmosColors.onLightText,
        onBackground: CosmosColors.onLightText,
        onError: CosmosColors.onDarkText,
        brightness: Brightness.light,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }

  static ThemeData buildDarkAppTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: CosmosColors.darkBg,
      disabledColor: CosmosColors.darkInactive,
      dividerColor: CosmosColors.darkDivider,
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: CosmosColors.darkBg,
        foregroundColor: CosmosColors.onDarkText,
        titleTextStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: CosmosColors.onDarkText,
        ),
      ),
      colorScheme: const ColorScheme(
        primary: CosmosColors.darkBg,
        primaryVariant: CosmosColors.darkSurface,
        secondary: CosmosColors.lightBg,
        secondaryVariant: CosmosColors.lightBg,
        surface: CosmosColors.darkSurface,
        background: CosmosColors.darkBg,
        error: CosmosColors.error,
        onPrimary: CosmosColors.onDarkText,
        onSecondary: CosmosColors.onLightText,
        onSurface: CosmosColors.onDarkText,
        onBackground: CosmosColors.onDarkText,
        onError: CosmosColors.onLightText,
        brightness: Brightness.dark,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
    );
  }
}

class CosmosColors {
  static const lightBg = Color(0xFFFFFFFF);
  static const onLightText = Color(0xFF000000);
  static const lightInactive = Color(0x2C000000);
  static const lightDivider = Color(0x17000000);
  static const lightSurface = Color(0xFFFFFFFF);

  static const darkBg = Color(0xFF000000);
  static const darkInactive = Color(0x2CFFFFFF);
  static const darkSurface = Color(0xFF171717);
  static const onDarkText = Color(0xFFFFFFFF);
  static const darkDivider = Color(0x17FFFFFF);

  static const error = Color(0xFFE74444);
}
