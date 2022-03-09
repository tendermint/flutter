import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosPasswordField extends StatefulWidget {
  const CosmosPasswordField({
    required this.onPasswordUpdated,
    this.helperText =
        'This password will be used to recover your account every time you log in to the app',
    this.hintText = 'Enter password',
    Key? key,
  }) : super(key: key);

  final Function(String) onPasswordUpdated;
  final String? helperText;
  final String hintText;

  @override
  State<CosmosPasswordField> createState() => _CosmosPasswordFieldState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('helperText', helperText))
      ..add(ObjectFlagProperty<Function(String p1)>.has(
          'onPasswordUpdated', onPasswordUpdated))
      ..add(StringProperty('hintText', hintText));
  }
}

class _CosmosPasswordFieldState extends State<CosmosPasswordField> {
  bool obscurePassword = true;

  void togglePasswordVisibility() =>
      setState(() => obscurePassword = !obscurePassword);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurePassword,
      onChanged: (value) {
        widget.onPasswordUpdated(value);
      },
      decoration: InputDecoration(
        hintText: widget.hintText,
        helperText: widget.helperText,
        helperMaxLines: 3,
        suffixIcon: InkWell(
          onTap: togglePasswordVisibility,
          child:
              Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<bool>('obscurePassword', obscurePassword));
  }
}
