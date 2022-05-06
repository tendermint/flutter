// import 'package:cosmos_ui_components/cosmos_text_theme.dart';
// import 'package:cosmos_ui_components/cosmos_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// ThemeData convertCosmosThemeToMaterialTheme(CosmosThemeData theme) {
//   final colorScheme = ColorScheme(
//     primary: theme.colors.text,
//     secondary: theme.colors.text,
//     surface: theme.colors.background,
//     background: theme.colors.background,
//     onPrimary: theme.colors.text,
//     onSecondary: theme.colors.text,
//     onSurface: theme.colors.background,
//     onBackground: theme.colors.text,
//     onError: theme.colors.chipBackground,
//     error: CosmosColorsData.defaultError,
//     // brightness: theme.brightness,
//   );
//   return ThemeData(
//     // brightness: theme.brightness,
//     textTheme: buildTextTheme(colorScheme),
//     appBarTheme: AppBarTheme(
//       systemOverlayStyle: theme.brightness == Brightness.light ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light,
//       backgroundColor: theme.colors.background,
//       foregroundColor: theme.colors.text,
//       actionsIconTheme: IconThemeData(
//         color: theme.colors.text,
//       ),
//       titleTextStyle: TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.w700,
//         color: theme.colors.text,
//       ),
//     ),
//     scaffoldBackgroundColor: theme.colors.background,
//     disabledColor: theme.colors.inactive,
//     dividerColor: theme.colors.divider,
//     colorScheme: colorScheme,
//     inputDecorationTheme: InputDecorationTheme(
//       filled: true,
//       fillColor: theme.colors.chipBackground,
//       border: const OutlineInputBorder(
//         borderSide: BorderSide.none,
//       ),
//     ),
//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.disabled)) {
//             return theme.colors.text.withOpacity(0.5);
//           } else {
//             return theme.colors.text;
//           }
//         }),
//         foregroundColor: MaterialStateProperty.all<Color>(theme.colors.background),
//       ),
//     ),
//     outlinedButtonTheme: OutlinedButtonThemeData(
//       style: ButtonStyle(
//         backgroundColor: MaterialStateProperty.all<Color>(theme.colors.background),
//         foregroundColor: MaterialStateProperty.resolveWith((states) {
//           if (states.contains(MaterialState.disabled)) {
//             return theme.colors.text.withOpacity(0.5);
//           } else {
//             return theme.colors.text;
//           }
//         }),
//         side: MaterialStateProperty.all<BorderSide>(
//           BorderSide(
//             color: theme.colors.text,
//           ),
//         ),
//       ),
//     ),
//   );
// }
//
// TextTheme buildTextTheme(ColorScheme colorScheme) => TextTheme(
//       headline2: CosmosTextTheme.title2Bold.copyWith(color: colorScheme.onSurface),
//       caption: CosmosTextTheme.copy0Normal.copyWith(color: colorScheme.onSurface.withOpacity(0.6)),
//     );
