import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenshotTestScenario extends StatelessWidget {
  const ScreenshotTestScenario({
    required this.themeData,
    required this.name,
    required this.builder,
    Key? key,
  }) : super(key: key);

  final CosmosThemeData themeData;
  final String name;
  final WidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeData.colors.background,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 18,
                color: themeData.colors.text,
              ),
              textHeightBehavior: const TextHeightBehavior(
                applyHeightToFirstAscent: false,
              ),
            ),
            const SizedBox(height: 8),
            CosmosTheme(
              themeData: themeData,
              child: Builder(
                builder: builder,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<CosmosThemeData>('themeData', themeData))
      ..add(StringProperty('name', name))
      ..add(ObjectFlagProperty<WidgetBuilder>.has('builder', builder));
  }
}
