import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_navigator.dart';

abstract class CloseRoute<T> {
  BuildContext get context;

  AppNavigator get appNavigator;

  void close() => appNavigator.close(context);

  void closeWithResult(T result) => appNavigator.closeWithResult(context, result);

  factory CloseRoute._() => throw UnsupportedError("This class is meant to be mixed in");
}
