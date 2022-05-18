import 'package:mobx/mobx.dart';

class ThemeStore {
  final Observable<bool> _isDarkTheme = Observable(false);

  bool get isDarkTheme => _isDarkTheme.value;

  set isDarkTheme(bool val) => Action(() => _isDarkTheme.value = val)();
}
