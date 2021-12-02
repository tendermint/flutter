import 'package:cosmos_ui_components/cosmos_app_theme.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CosmosTheme extends InheritedWidget {
  final CosmosThemeData themeData;

  static CosmosThemeData of(BuildContext context) {
    final cosmosTheme = context.dependOnInheritedWidgetOfExactType<CosmosTheme>();
    assert(cosmosTheme != null, "No 'CosmosTheme' widget found in the widget tree");
    return cosmosTheme!.themeData;
  }

  // TODO stop using CosmosAppTheme
  //ignore: deprecated_member_use_from_same_package
  static ThemeData buildDarkAppTheme() => CosmosAppTheme.buildDarkAppTheme();

  // TODO stop using CosmosAppTheme
  //ignore: deprecated_member_use_from_same_package
  static ThemeData buildAppTheme() => CosmosAppTheme.buildAppTheme();

  const CosmosTheme({
    Key? key,
    this.themeData = const CosmosThemeData(),
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(CosmosTheme oldWidget) => oldWidget.themeData != themeData;
}

class CosmosThemeData extends Equatable {
  static const offWhite = Color(0xFFF2F2F2);

  static const defaultSpacingXXXL = 40.0;
  static const defaultSpacingXXL = 32.0;
  static const defaultSpacingXL = 24.0;
  static const defaultSpacingL = 16.0;
  static const defaultSpacingM = 8.0;
  static const defaultSpacingS = 4.0;
  static const defaultSpacingXS = 2.0;

  static const defaultLongDuration = 500;
  static const defaultMediumDuration = 300;
  static const defaultShortDuration = 150;

  static const defaultRadiusXL = 30.0;
  static const defaultRadiusL = 12.0;
  static const defaultRadiusM = 10.0;
  static const defaultRadiusS = 4.0;

  static const defaultFontSizeS = 12.0;
  static const defaultFontSizeM = 16.0;
  static const defaultFontSizeL = 20.0;
  static const defaultFontSizeXL = 28.0;
  static const defaultFontSizeXXL = 40.0;
  static const defaultElevationS = 4.0;

  static const defaultBorderRadiusL = BorderRadius.all(Radius.circular(defaultRadiusL));
  static const defaultBorderRadiusM = BorderRadius.all(Radius.circular(defaultRadiusM));
  static const defaultBorderRadiusS = BorderRadius.all(Radius.circular(defaultRadiusS));

  final double spacingXXXL;
  final double spacingXXL;
  final double spacingXL;
  final double spacingL;
  final double spacingM;
  final double spacingS;
  final double spacingXS;
  final int longDuration;
  final int mediumDuration;
  final int shortDuration;
  final double radiusXL;
  final double radiusL;
  final double radiusM;
  final double radiusS;
  final double fontSizeS;
  final double fontSizeM;
  final double fontSizeL;
  final double fontSizeXL;
  final double fontSizeXXL;
  final double elevationS;
  final BorderRadius borderRadiusM;
  final BorderRadius borderRadiusL;
  final BorderRadius borderRadiusS;
  final CosmosColorsData colors;

  const CosmosThemeData({
    this.spacingXXXL = defaultSpacingXXXL,
    this.spacingXXL = defaultSpacingXXL,
    this.spacingXL = defaultSpacingXL,
    this.spacingL = defaultSpacingL,
    this.spacingM = defaultSpacingM,
    this.spacingS = defaultSpacingS,
    this.spacingXS = defaultSpacingXS,
    this.longDuration = defaultLongDuration,
    this.mediumDuration = defaultMediumDuration,
    this.shortDuration = defaultShortDuration,
    this.radiusXL = defaultRadiusXL,
    this.radiusL = defaultRadiusL,
    this.radiusM = defaultRadiusM,
    this.radiusS = defaultRadiusS,
    this.fontSizeS = defaultFontSizeS,
    this.fontSizeM = defaultFontSizeM,
    this.fontSizeL = defaultFontSizeL,
    this.fontSizeXL = defaultFontSizeXL,
    this.fontSizeXXL = defaultFontSizeXXL,
    this.borderRadiusL = defaultBorderRadiusL,
    this.borderRadiusM = defaultBorderRadiusM,
    this.borderRadiusS = defaultBorderRadiusS,
    this.elevationS = defaultElevationS,
    this.colors = const CosmosColorsData(),
  });

  @override
  List<Object?> get props => [
        spacingXXXL,
        spacingXXL,
        spacingL,
        spacingM,
        spacingS,
        spacingXS,
        longDuration,
        mediumDuration,
        shortDuration,
        radiusXL,
        radiusM,
        radiusS,
        fontSizeS,
        fontSizeM,
        fontSizeL,
        fontSizeXL,
        fontSizeXXL,
        borderRadiusM,
        borderRadiusS,
      ];
}

class CosmosColorsData extends Equatable {
  static const lightBg = Color(0xFFFFFFFF);
  static const lightCardBg = Color(0x08000000);
  static const onLightText = Color(0xFF000000);
  static const lightInactive = Color(0x2C000000);
  static const lightDivider = Color(0x1A000000);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightLink = Color(0xFF094EFD);
  static const lightChip = Color(0xFFF0F0F0);
  static const lightPositive = Color(0xFF008223);
  static const lightGrey = Color(0x54000000);
  static const lightBorder = Color(0xFFC6C6C8);
  static const silver = Color(0xFFD7D7D7);

  static const darkBg = Color(0xFF000000);
  static const darkInactive = Color(0x2CFFFFFF);
  static const darkSurface = Color(0xFF171717);
  static const onDarkText = Color(0xFFFFFFFF);
  static const darkDivider = Color(0x17FFFFFF);
  static const error = Color(0xFFE74444);

  final Color inactive;
  final Color divider;
  final Color text;
  final Color background;
  final Color cardBackground;
  final Color actionSheetPositive;
  final Color actionSheetDestructive;
  final Color chipBackground;
  final Color positiveText;
  final Color link;
  final Color inputBorder;
  final Color avatarBg;

  const CosmosColorsData({
    this.inactive = lightInactive,
    this.divider = lightDivider,
    this.text = onLightText,
    this.background = lightBg,
    this.cardBackground = lightCardBg,
    this.actionSheetPositive = Colors.lightBlue,
    this.actionSheetDestructive = error,
    this.chipBackground = lightChip,
    this.link = lightLink,
    this.positiveText = lightPositive,
    this.inputBorder = lightBorder,
    this.avatarBg = silver,
  });

  @override
  List<Object?> get props => [
        inactive,
        divider,
        text,
        background,
        cardBackground,
        actionSheetPositive,
        actionSheetDestructive,
        chipBackground,
        link,
        positiveText,
        inputBorder,
        avatarBg,
      ];
}
