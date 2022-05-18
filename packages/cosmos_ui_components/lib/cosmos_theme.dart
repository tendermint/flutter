import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/utils/theme_converter.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const darkThemeColors = CosmosColorsData(
  inactive: CosmosColorsData.darkInactive,
  divider: CosmosColorsData.darkDivider,
  text: CosmosColorsData.onDarkText,
  background: CosmosColorsData.darkBg,
  inputBorder: CosmosColorsData.darkDivider,
  chipBackground: CosmosColorsData.darkSurface,
  cardBackground: CosmosColorsData.darkSurface,
  shadowColor: CosmosColorsData.onDarkText,
);

const lightThemeColors = CosmosColorsData();

class CosmosTheme extends InheritedWidget {
  const CosmosTheme({
    required Widget child,
    this.themeData = const CosmosThemeData.light(),
    this.darkThemeData = const CosmosThemeData.dark(),
    this.brightness = Brightness.light,
    Key? key,
  }) : super(key: key, child: child);

  final CosmosThemeData themeData;
  final CosmosThemeData darkThemeData;
  final Brightness brightness;

  static CosmosThemeData of(BuildContext context) {
    final cosmosTheme = context.dependOnInheritedWidgetOfExactType<CosmosTheme>();
    assert(cosmosTheme != null, "No 'CosmosTheme' widget found in the widget tree");
    return cosmosTheme!.brightness == Brightness.dark ? cosmosTheme.themeData : cosmosTheme.darkThemeData;
  }

  @Deprecated('Use CosmosTheme instead')
  static ThemeData buildTheme(BuildContext context) => convertCosmosThemeToMaterialTheme(of(context));

  @Deprecated('Use CosmosTheme instead')
  static ThemeData buildDarkAppTheme() => CosmosAppTheme.buildDarkAppTheme();

  @Deprecated('Use CosmosTheme instead')
  static ThemeData buildAppTheme() => CosmosAppTheme.buildAppTheme();

  @override
  bool updateShouldNotify(CosmosTheme oldWidget) => oldWidget.themeData != themeData;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<CosmosThemeData>('themeData', themeData))
      ..add(EnumProperty<Brightness>('brightness', brightness))
      ..add(DiagnosticsProperty<CosmosThemeData>('darkThemeData', darkThemeData));
  }
}

class CosmosThemeData extends Equatable {
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
    this.elevationM = defaultElevationM,
    this.elevationL = defaultElevationL,
    this.colors = const CosmosColorsData(),
    this.brightness = Brightness.light,
  });

  const CosmosThemeData.dark() : this(colors: darkThemeColors, brightness: Brightness.dark);

  const CosmosThemeData.light() : this(colors: lightThemeColors, brightness: Brightness.light);

  ThemeData buildFlutterTheme() => convertCosmosThemeToMaterialTheme(this);

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
  static const defaultElevationM = 8.0;
  static const defaultElevationL = 12.0;

  static const defaultBorderRadiusL = BorderRadius.all(Radius.circular(defaultRadiusL));
  static const defaultBorderRadiusM = BorderRadius.all(Radius.circular(defaultRadiusM));
  static const defaultBorderRadiusS = BorderRadius.all(Radius.circular(defaultRadiusS));

  final Brightness brightness;

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
  final double elevationM;
  final double elevationL;
  final BorderRadius borderRadiusM;
  final BorderRadius borderRadiusL;
  final BorderRadius borderRadiusS;
  final CosmosColorsData colors;

  @override
  List<Object?> get props => [
        spacingXXXL,
        spacingXXL,
        spacingXL,
        spacingL,
        spacingM,
        spacingS,
        spacingXS,
        longDuration,
        mediumDuration,
        shortDuration,
        radiusXL,
        radiusL,
        radiusM,
        radiusS,
        fontSizeS,
        fontSizeM,
        fontSizeL,
        fontSizeXL,
        fontSizeXXL,
        borderRadiusL,
        borderRadiusM,
        borderRadiusS,
        elevationS,
        elevationM,
        elevationL,
        colors,
      ];
}

class CosmosColorsData extends Equatable {
  const CosmosColorsData({
    this.inactive = lightInactive,
    this.divider = lightDivider,
    this.text = onLightText,
    this.background = lightBg,
    this.cardBackground = lightCardBg,
    this.actionSheetPositive = Colors.lightBlue,
    this.actionSheetDestructive = iosError,
    this.chipBackground = lightChip,
    this.link = lightLink,
    this.positiveText = lightPositive,
    this.inputBorder = lightBorder,
    this.avatarBg = silver,
    this.error = defaultError,
    this.shadowColor = onLightText,
  });

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
  static const darkDivider = Color(0xFFFFFFFF);
  static const darkChip = Color(0xFF0F0F0F);
  static const iosError = Color(0xFFE74444);
  static const defaultError = Color(0xFFFF3D56);
  static const defaultShadowColor = Colors.black38;

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
  final Color error;
  final Color shadowColor;

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
        error,
        shadowColor,
      ];
}
