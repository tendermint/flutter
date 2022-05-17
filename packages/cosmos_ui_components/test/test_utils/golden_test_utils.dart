import 'dart:async';

import 'package:alchemist/alchemist.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

final testThemes = {
  'light': const CosmosThemeData(),
  'dark': cosmosDarkThemeData,
};

@isTest
Future<void> screenshotTest(
  String description, {
  required Widget Function(CosmosThemeData themeData) pageBuilder,
  bool skip = false,
  void Function()? setUp,
  List<String> tags = const ['golden'],
  Map<String, CosmosThemeData>? themes,
  Duration timeout = const Duration(seconds: 5),
}) async {
  setUp?.call();
  return goldenTest(
    description,
    fileName: description,
    builder: () => GoldenTestGroup(
      children: (themes ?? testThemes).entries.map(
        (entry) {
          return DefaultAssetBundle(
            bundle: TestAssetBundle(),
            child: GoldenTestScenario(
              name: entry.key,
              child: pageBuilder(entry.value),
            ),
          );
        },
      ).toList(),
    ),
    tags: tags,
    skip: skip,
    pumpBeforeTest: (tester) => mockNetworkImages(() => precacheImages(tester)).timeout(timeout),
    pumpWidget: (tester, widget) => mockNetworkImages(() => tester.pumpWidget(widget)).timeout(timeout),
  ).timeout(timeout);
}
