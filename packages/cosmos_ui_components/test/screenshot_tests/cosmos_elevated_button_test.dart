import 'package:alchemist/alchemist.dart';
import 'package:cosmos_ui_components/components/cosmos_elevated_button.dart';

import '../test_utils/golden_test_utils.dart';
import '../test_utils/screenshot_test_scenario.dart';

void main() {
  screenshotTest(
    'cosmos_elevated_button',
    pageBuilder: (themeData) => GoldenTestGroup(
      children: [
        ScreenshotTestScenario(
          name: 'normal',
          themeData: themeData,
          builder: (context) => CosmosElevatedButton(
            text: 'Elevated Button',
            onTap: () {},
          ),
        ),
        ScreenshotTestScenario(
          name: 'disabled',
          themeData: themeData,
          builder: (context) => const CosmosElevatedButton(
            text: 'Elevated Button',
          ),
        )
      ],
    ),
  );
}
