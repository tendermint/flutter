import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordPromptPage extends StatefulWidget {
  const PasswordPromptPage({
    required this.setUpPasscode,
    this.message,
    Key? key,
  }) : super(key: key);

  final String? message;

  static Future<String?> promptPassword(BuildContext context, {String? message}) => _showPage(
        context,
        setUpPasscode: false,
        message: message,
      );

  static Future<String?> createPassword(BuildContext context) => _showPage(
        context,
        setUpPasscode: true,
        message: 'Provide passcode that we will use to secure your wallet data',
      );

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
          key: ValueKey(_title),
          title: _title,
          message: widget.message,
          onSubmit: widget.setUpPasscode ? _onSetUpPasscodeSubmit : _onPasscodeSubmit,
        ),
      ),
    );
  }

  void _onSetUpPasscodeSubmit(String value) {
    setState(() => _passcodes.add(value));
    if (_passcodes.length == 2) {
      if (_arePasscodesValid) {
        _savePasscode();
      } else {
        _showPasscodeError();
      }
    }
  }

  void _onPasscodeSubmit(String value) {
    Navigator.of(context).pop(value);
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
    debugPrint('Saving!');
    Navigator.of(context).pop(_passcodes[0]);
  }
}
