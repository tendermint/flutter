import 'package:cosmos_auth/auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';

class SettingsStore {
  SettingsStore(
    this._cosmosAuth,
    this._secureDataStore,
  );

  static const _appLockKey = 'settings_app_lock';
  static const _biometricsKey = 'settings_biometrics';

  final CosmosAuth _cosmosAuth;
  final SecureDataStore _secureDataStore;
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
    if (!(await hasPasswordSet())) {
      appLockEnabled = false;
    }
    biometricsEnabled = prefs.getBool(_biometricsKey) ?? false;
    _isInitialized = true;
  }

  Future<bool> hasPasswordSet() => _cosmosAuth
      .hasPassword(
        secureDataStore: _secureDataStore,
        id: PasswordPromptPage.starportPassId,
      )
      .asyncFold(
        (fail) => false,
        (success) => success,
      );
}

Future<void> _saveBoolInPrefs(String key, bool value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool(key, value);
}
