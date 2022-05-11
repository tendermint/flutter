import 'dart:io';

import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_ui_components/components/template/settings_item.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/stores/settings_store.dart';

class SecuritySheet extends StatefulWidget {
  const SecuritySheet({Key? key}) : super(key: key);

  @override
  State<SecuritySheet> createState() => _SecuritySheetState();
}

class _SecuritySheetState extends State<SecuritySheet> {
  SettingsStore get _settingsStore => StarportApp.settingsStore;

  List<BiometricType> _biometricTypes = [];

  bool get _hasBiometrics => _biometricTypes.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _getAvailableBiometrics();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Column(
      children: [
        CosmosBottomSheetHeader(
          title: 'Security',
          titleTextStyle: CosmosTextTheme.title2Bold,
          leading: const Icon(Icons.ten_k, color: Colors.transparent),
          actions: [
            CosmosTextButton(
              text: 'Close',
              onTap: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        SizedBox(height: theme.spacingXXL),
        SettingsItem(
          text: 'App Lock',
          infoIcon: CosmosSwitch(
            checked: _settingsStore.appLockEnabled,
            onChanged: _setAppLockEnabled,
          ),
          showArrow: false,
          textStyle: CosmosTextTheme.copy0Normal,
          onTap: () => _setAppLockEnabled(!_settingsStore.appLockEnabled),
        ),
        if (_hasBiometrics)
          SettingsItem(
            text: biometricsTitle(),
            infoIcon: CosmosSwitch(
              checked: _settingsStore.biometricsEnabled,
              onChanged: _setBiometricsEnabled,
            ),
            showArrow: false,
            textStyle: CosmosTextTheme.copy0Normal,
            onTap: () => _setBiometricsEnabled(!_settingsStore.biometricsEnabled),
          ),
        MinimalBottomSpacer(padding: theme.spacingXXXL)
      ],
    );
  }

  void _setBiometricsEnabled(bool checked) => setState(() => _settingsStore.biometricsEnabled = checked);

  Future<void> _setAppLockEnabled(bool checked) async {
    if (checked && !await _settingsStore.hasPasswordSet()) {
      final result = await PasswordPromptPage.promptPassword(context);
      setState(() => _settingsStore.appLockEnabled = result != null);
    }
    setState(() => _settingsStore.appLockEnabled = checked);
  }

  String biometricsTitle() {
    if (Platform.isIOS) {
      if (_biometricTypes.contains(BiometricType.face)) {
        return 'Face ID';
      } else if (_biometricTypes.contains(BiometricType.fingerprint)) {
        return 'Touch ID';
      }
    } else {
      if (_biometricTypes.contains(BiometricType.face)) {
        return 'Face Unlock';
      } else if (_biometricTypes.contains(BiometricType.fingerprint)) {
        return 'Fingerprint Unlock';
      } else if (_biometricTypes.contains(BiometricType.iris)) {
        return 'Iris unlock';
      }
    }
    return 'Biometrics';
  }

  Future<void> _getAvailableBiometrics() async {
    _biometricTypes = await StarportApp.cosmosAuth.getAvailableBiometrics().asyncFold(
          (fail) => [],
          (success) => success,
        );
    setState(() {});
  }
}
