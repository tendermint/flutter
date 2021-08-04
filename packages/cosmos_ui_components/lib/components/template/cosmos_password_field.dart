import 'package:flutter/material.dart';

class CosmosPasswordField extends StatefulWidget {
  final Function(String) onPasswordUpdated;

  const CosmosPasswordField({required this.onPasswordUpdated});

  @override
  _CosmosPasswordFieldState createState() => _CosmosPasswordFieldState();
}

class _CosmosPasswordFieldState extends State<CosmosPasswordField> {
  bool obscurePassword = true;

  void togglePasswordVisibility() => setState(() => obscurePassword = !obscurePassword);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscurePassword,
      onChanged: (value) {
        widget.onPasswordUpdated(value);
      },
      decoration: InputDecoration(
        hintText: 'Enter password',
        helperText: 'This password will be used to recover your account every time you log in to the app',
        helperMaxLines: 3,
        suffixIcon: InkWell(
          onTap: togglePasswordVisibility,
          child: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
        ),
      ),
    );
  }
}