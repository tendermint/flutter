import 'package:cosmos_ui_components/components/template/cosmos_password_field.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class PasswordSetupSheet extends StatefulWidget {
  final void Function(String, String) submitClicked;

  const PasswordSetupSheet({
    Key? key,
    required this.submitClicked,
  }) : super(key: key);

  @override
  _PasswordSetupSheetState createState() => _PasswordSetupSheetState();
}

class _PasswordSetupSheetState extends State<PasswordSetupSheet> {
  String password = "";
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CosmosAppTheme.spacingM),
        child: Column(
          children: [
            const SizedBox(height: CosmosAppTheme.spacingL),
            TextFormField(
              decoration: const InputDecoration(hintText: "Name"),
              onChanged: (value) => setState(() => name = value),
            ),
            const SizedBox(height: CosmosAppTheme.spacingM),
            CosmosPasswordField(
              onPasswordUpdated: (value) => setState(() => password = value),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: password.isEmpty || name.isEmpty
            ? null
            : () {
                widget.submitClicked(password, name);
                Navigator.of(context).pop();
              },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
