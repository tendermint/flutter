import 'package:cosmos_ui_components/components/template/cosmos_password_field.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';

class AddWalletBottomSheet extends StatefulWidget {
  final void Function(ImportWalletFormData) importClicked;

  const AddWalletBottomSheet({
    Key? key,
    required this.importClicked,
  }) : super(key: key);

  @override
  _AddWalletBottomSheetState createState() => _AddWalletBottomSheetState();
}

class _AddWalletBottomSheetState extends State<AddWalletBottomSheet> {
  String _mnemonic = "";
  String _alias = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: "Enter mnemonic",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _mnemonic = value,
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: "Enter alias",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => _alias = value,
            ),
          ),
          ListTile(
            title: CosmosPasswordField(
              onPasswordUpdated: (value) => _password = value,
            ),
          ),
          ElevatedButton(
            onPressed: () => _importClicked(context),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            child: const Text("Import wallet"),
          ),
        ],
      ),
    );
  }

  void _importClicked(BuildContext context) {
    Navigator.of(context).pop();
    widget.importClicked(
      ImportWalletFormData(
        mnemonic: _mnemonic,
        name: _alias,
        password: _password,
      ),
    );
  }
}
