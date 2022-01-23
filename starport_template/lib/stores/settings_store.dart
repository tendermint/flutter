import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsStore {
  SettingsStore();

  static const _appLockKey = 'settings_app_lock';
  static const _biometricsKey = 'settings_biometrics';

  final Observable<bool> _appLockEnabled = Observable(false);
  final Observable<bool> _biometricsEnabled = Observable(false);

  bool get isInitialized => _isInitialized;

  bool _isInitialized = false;

  bool get appLockEnabled => _appLockEnabled.value;

  bool get biometricsEnabled => _biometricsEnabled.value;

  set appLockEnabled(bool value) => Action(() {
        _saveBoolInPrefs(_appLockKey, value);
        return _appLockEnabled.value = value;
      })();

  set biometricsEnabled(bool value) => Action(() {
        _saveBoolInPrefs(_biometricsKey, value);
        return _biometricsEnabled.value = value;
      })();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    appLockEnabled = prefs.getBool(_appLockKey) ?? false;
    biometricsEnabled = prefs.getBool(_biometricsKey) ?? false;
    _isInitialized = true;
  }
}

Future<void> _saveBoolInPrefs(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}
