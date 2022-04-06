import 'package:cosmos_auth/auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starport_template/app_config.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/utils/node_info_loader.dart';

class SettingsStore {
  SettingsStore(
    this._cosmosAuth,
    this._secureDataStore,
    this._baseEnv,
  );

  static const _appLockKey = 'settings_app_lock';
  static const _biometricsKey = 'settings_biometrics';
  static const _nodeNetworkKey = 'node_network';

  final CosmosAuth _cosmosAuth;
  final AppConfig _baseEnv;
  final SecureDataStore _secureDataStore;
  final Observable<bool> _appLockEnabled = Observable(false);
  final Observable<bool> _biometricsEnabled = Observable(false);
  final Observable<String> _nodeNetwork = Observable('Unknown');

  bool get isInitialized => _isInitialized;
  bool _isInitialized = false;

  bool get appLockEnabled => _appLockEnabled.value;
  bool get biometricsEnabled => _biometricsEnabled.value;
  String get nodeNetwork => _nodeNetwork.value;

  set appLockEnabled(bool value) => Action(() {
        _saveBoolInPrefs(_appLockKey, value);
        return _appLockEnabled.value = value;
      })();

  set biometricsEnabled(bool value) => Action(() {
        _saveBoolInPrefs(_biometricsKey, value);
        return _biometricsEnabled.value = value;
      })();

  set nodeNetwork(String value) => Action(() {
        _saveStringInPrefs(_nodeNetworkKey, value);
        return _nodeNetwork.value = value;
      })();

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    appLockEnabled = prefs.getBool(_appLockKey) ?? false;
    if (!(await hasPasswordSet())) {
      appLockEnabled = false;
    }
    biometricsEnabled = prefs.getBool(_biometricsKey) ?? false;
    nodeNetwork = await NodeInfoLoader(_baseEnv).getChainId();
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

Future<void> _saveStringInPrefs(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString(key, value);
}
