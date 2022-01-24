import 'package:cosmos_ui_components/components/template/cosmos_password_field.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PasswordSetupSheet extends StatefulWidget {
  const PasswordSetupSheet({
    required this.submitClicked,
    Key? key,
  }) : super(key: key);

  final void Function(String, String) submitClicked;

  @override
  State<PasswordSetupSheet> createState() => _PasswordSetupSheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ObjectFlagProperty<void Function(String p1, String p2)>.has('submitClicked', submitClicked));
  }
}

class _PasswordSetupSheetState extends State<PasswordSetupSheet> {
  String password = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingM),
        child: Column(
          children: [
            SizedBox(height: CosmosTheme.of(context).spacingL),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Name'),
              onChanged: (value) => setState(() => name = value),
            ),
            SizedBox(height: CosmosTheme.of(context).spacingM),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('name', name))
      ..add(StringProperty('password', password));
  }
}
