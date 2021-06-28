import 'package:flutter/widgets.dart';
import 'package:flutter_app/navigation/app_navigator.dart';

/// used with navigators that don't have any routes (yet).
abstract class NoRoutes {
  BuildContext get context;

  AppNavigator get appNavigator;

  factory NoRoutes._() => throw UnsupportedError("This class is meant to be mixed in");
}
