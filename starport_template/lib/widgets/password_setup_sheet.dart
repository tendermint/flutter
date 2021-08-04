import 'package:flutter/material.dart';

class PasswordSetupSheet extends StatefulWidget {
  final void Function(String) submitClicked;

  const PasswordSetupSheet({
    Key? key,
    required this.submitClicked,
  }) : super(key: key);

  @override
  _PasswordSetupSheetState createState() => _PasswordSetupSheetState();
}

class _PasswordSetupSheetState extends State<PasswordSetupSheet> {
  bool obscurePassword = true;

  void togglePasswordVisibility() => setState(() => obscurePassword = !obscurePassword);

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextFormField(
            obscureText: obscurePassword,
            controller: _passwordController,
            decoration: InputDecoration(
              hintText: 'Enter password',
              helperText: 'This password will be used to recover your account every time you log in to the app',
              helperMaxLines: 3,
              suffixIcon: InkWell(
                onTap: togglePasswordVisibility,
                child: Icon(obscurePassword ? Icons.visibility : Icons.visibility_off),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => widget.submitClicked(_passwordController.text),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
