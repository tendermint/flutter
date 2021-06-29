import 'package:flutter_app/navigation/app_navigator.dart';
import 'package:flutter_app/utils/strings.dart';

class AppInitializer {
  Future<void> init() async {
    initializeAppLocalizations(AppNavigator.navigatorKey.currentContext!);
  }
}
