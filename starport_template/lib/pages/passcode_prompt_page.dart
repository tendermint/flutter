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
      message: hasPassword ? message : 'Provide passcode that we will use to secure your account data',
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
      backgroundColor: CosmosTheme.of(context).colors.background,
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

// class CosmosPasscodePrompt extends StatefulWidget {
//   const CosmosPasscodePrompt({
//     required this.title,
//     this.message,
//     this.cancelAction,
//     this.cancelText = 'Cancel',
//     Key? key,
//     this.pinCount = 6,
//     this.onChanged,
//     this.onSubmit,
//   }) : super(key: key);
//
//   final String title;
//   final String? message;
//   final String cancelText;
//   final int pinCount;
//   final VoidCallback? cancelAction;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmit;
//
//   @override
//   State<CosmosPasscodePrompt> createState() => _CosmosPasscodePromptState();
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties
//       ..add(StringProperty('title', title))
//       ..add(StringProperty('cancelText', cancelText))
//       ..add(ObjectFlagProperty<ValueChanged<String>?>.has('onSubmit', onSubmit))
//       ..add(StringProperty('message', message))
//       ..add(IntProperty('pinCount', pinCount))
//       ..add(ObjectFlagProperty<VoidCallback?>.has('cancelAction', cancelAction))
//       ..add(ObjectFlagProperty<ValueChanged<String>?>.has('onChanged', onChanged));
//   }
// }
//
// class _CosmosPasscodePromptState extends State<CosmosPasscodePrompt> {
//   late TextEditingController _pinPutController;
//
//   static const filledOpacity = 0.44;
//   static const unfilledOpacity = 0.11;
//
//   BoxDecoration get _pinPutDecoration {
//     return BoxDecoration(
//       shape: BoxShape.circle,
//       color: CosmosTheme.of(context).colors.text.withOpacity(unfilledOpacity),
//     );
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _pinPutController = TextEditingController();
//   }
//
//   @override
//   void dispose() {
//     _pinPutController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = CosmosTheme.of(context);
//     return Center(
//       child: SizedBox(
//         width: max(225, MediaQuery.of(context).size.width * 0.7),
//         child: Column(
//           children: [
//             const Spacer(flex: 3),
//             if (widget.message != null) ...[
//               Text(
//                 widget.message!,
//                 textAlign: TextAlign.center,
//                 style: CosmosTextTheme.copy0Normal.copyWith(color: theme.),
//               ),
//               SizedBox(
//                 height: CosmosTheme.of(context).spacingL,
//               )
//             ],
//             Text(
//               widget.title,
//               style: CosmosTextTheme.labelL.copyWith(color: CosmosTheme.of(context).colors.text),
//             ),
//             SizedBox(height: CosmosTheme.of(context).spacingXL),
//             PinPut(
//               controller: _pinPutController,
//               fieldsCount: widget.pinCount,
//               fieldsAlignment: MainAxisAlignment.center,
//               eachFieldMargin: const EdgeInsets.symmetric(horizontal: 12),
//               eachFieldConstraints: const BoxConstraints(
//                 maxHeight: 10,
//                 maxWidth: 10,
//               ),
//               textStyle: const TextStyle(fontSize: 0, color: Colors.transparent),
//               eachFieldHeight: 10,
//               useNativeKeyboard: false,
//               enableInteractiveSelection: false,
//               submittedFieldDecoration: _pinPutDecoration.copyWith(
//                 color: CosmosTheme.of(context).colors.text.withOpacity(filledOpacity),
//               ),
//               selectedFieldDecoration: _pinPutDecoration,
//               followingFieldDecoration: _pinPutDecoration,
//             ),
//             const Spacer(flex: 2),
//             _keyboard(),
//             const MinimalBottomSpacer(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   GridView _keyboard() {
//     return GridView.count(
//       crossAxisCount: 3,
//       childAspectRatio: 1.2,
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       children: [
//         ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map(_digitButton),
//         _cancelButton(),
//         _digitButton(0),
//         _backspaceButton(),
//       ],
//     );
//   }
//
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(StringProperty('title', widget.title));
//   }
//
//   Widget _digitButton(int digit) {
//     final theme = CosmosTheme.of(context);
//     return TextButton(
//       style: TextButton.styleFrom(
//         textStyle: CosmosTextTheme.headingM.copyWith(color: theme.colors.text),
//       ),
//       child: Text(
//         '$digit',
//         style: CosmosTextTheme.headingM.copyWith(color: CosmosTheme.of(context).colors.text),
//       ),
//       onPressed: () {
//         if (_pinPutController.text.length >= widget.pinCount) {
//           return;
//         }
//
//         _pinPutController.text = '${_pinPutController.text}$digit';
//         _notifyListeners();
//       },
//     );
//   }
//
//   Widget _cancelButton() {
//     return TextButton(
//       style: TextButton.styleFrom(
//         textStyle: CosmosTextTheme.copy0Normal.copyWith(
//           color: CosmosTheme.of(context).colors.text,
//         ),
//       ),
//       onPressed: widget.cancelAction ?? () => Navigator.of(context).pop(),
//       child: Text(
//         widget.cancelText,
//         style: CosmosTextTheme.copy0Normal.copyWith(
//           color: CosmosTheme.of(context).colors.text,
//         ),
//       ),
//     );
//   }
//
//   Widget _backspaceButton() => TextButton(
//     child: Text(
//       '⌫',
//       style: CosmosTextTheme.copy0Normal.copyWith(
//         color: CosmosTheme.of(context).colors.text,
//       ),
//     ),
//     onPressed: () {
//       if (_pinPutController.text.isNotEmpty) {
//         _pinPutController.text = _pinPutController.text.substring(0, _pinPutController.text.length - 1);
//         _notifyListeners();
//       }
//     },
//   );
//
//   void _notifyListeners() {
//     setState(() {});
//     widget.onChanged?.call(_pinPutController.text);
//     if (widget.pinCount == _pinPutController.text.length) {
//       widget.onSubmit?.call(_pinPutController.text);
//     }
//   }
// }
