import 'package:cosmos_ui_components/components/template/cosmos_password_field.dart';
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
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CosmosPasswordField(
            onPasswordUpdated: (value) {
              password = value;
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => password != null ? widget.submitClicked(password!) : null,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
