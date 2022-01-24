import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/starport_app.dart';

class PasswordPromptPage extends StatefulWidget {
  const PasswordPromptPage({
    required this.setUpPasscode,
    this.message,
    Key? key,
  }) : super(key: key);

  static const String starportPassId = 'mainPass';

  final String? message;

  static Future<String?> promptPassword(BuildContext context, {String? message}) async {
    final hasPassword = await StarportApp.settingsStore.hasPasswordSet();
    // ignore: use_build_context_synchronously
    return _showPage(
      context,
      setUpPasscode: !hasPassword,
      message: hasPassword ? message : 'Provide passcode that we will use to secure your wallet data',
    );
  }

  static Future<String?> _showPage(
    BuildContext context, {
    required bool setUpPasscode,
    required String? message,
  }) =>
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PasswordPromptPage(
            setUpPasscode: setUpPasscode,
            message: message,
          ),
        ),
      );

  final bool setUpPasscode;

  @override
  State<PasswordPromptPage> createState() => _PasswordPromptPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('setUpPasscode', setUpPasscode))
      ..add(StringProperty('message', message));
  }
}

class _PasswordPromptPageState extends State<PasswordPromptPage> {
  final List<String> _passcodes = [];

  bool get _arePasscodesValid => _passcodes.length == 2 && _passcodes[0] == _passcodes[1];

  int _attempts = 0;

  ValueKey get _promptKey => ValueKey(_attempts);

  @override
  void initState() {
    super.initState();
    _runBiometricsCheck();
  }

  String get _title {
    const enterTitle = 'Enter your passcode';
    const confirmTitle = 'Confirm your passcode';
    if (widget.setUpPasscode) {
      if (_passcodes.isEmpty) {
        return enterTitle;
      } else {
        return confirmTitle;
      }
    } else {
      return enterTitle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CosmosPasscodePrompt(
          key: _promptKey,
          title: _title,
          message: widget.message,
          onSubmit: widget.setUpPasscode ? _onSetUpPasscodeSubmit : _onPasscodeSubmit,
        ),
      ),
    );
  }

  void _onSetUpPasscodeSubmit(String value) {
    _attempts++;
    setState(() => _passcodes.add(value));
    if (_passcodes.length == 2) {
      if (_arePasscodesValid) {
        _savePasscode();
      } else {
        _showPasscodeError();
      }
    }
  }

  Future<void> _onPasscodeSubmit(String value) async {
    final password = await StarportApp.cosmosAuth.readPassword(
      secureDataStore: StarportApp.secureDataStore,
      id: PasswordPromptPage.starportPassId,
      useBiometrics: false,
    );
    _attempts++;
    if (password.getOrElse(() => value) == value) {
      if (mounted) {
        Navigator.of(context).pop(value);
      }
    } else {
      _passcodes.clear();
      _showPasscodeError();
      setState(() {});
    }
  }

  void _showPasscodeError() {
    setState(_passcodes.clear);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Passcodes didn't match, please try again"),
      ),
    );
  }

  void _savePasscode() {
    StarportApp.cosmosAuth.savePassword(
      secureDataStore: StarportApp.secureDataStore,
      id: PasswordPromptPage.starportPassId,
      password: _passcodes[0],
    );
    Navigator.of(context).pop(_passcodes[0]);
  }

  Future<void> _runBiometricsCheck() async {
    final cosmosAuth = StarportApp.cosmosAuth;
    final availableBiometrics = await cosmosAuth.getAvailableBiometrics().asyncFold(
          (fail) => [],
          (types) => types,
        );

    if (StarportApp.settingsStore.biometricsEnabled && availableBiometrics.isNotEmpty) {
      final password = await cosmosAuth
          .readPassword(
            secureDataStore: StarportApp.secureDataStore,
            id: PasswordPromptPage.starportPassId,
          )
          .asyncFold(
            (fail) => null,
            (success) => success,
          );
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop(password ?? '');
    }
  }
}
