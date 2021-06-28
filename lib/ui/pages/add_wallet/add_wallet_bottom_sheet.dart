import 'package:flutter/material.dart';
import 'package:flutter_app/domain/entities/import_wallet_form_data.dart';

abstract class AddWalletRoute {
  BuildContext get context;

  Future<ImportWalletFormData?> openAddWallet() => showModalBottomSheet(
        context: context,
        builder: (context) => const AddWalletBottomSheet(),
      );
}

class AddWalletBottomSheet extends StatefulWidget {
  const AddWalletBottomSheet({Key? key}) : super(key: key);

  @override
  _AddWalletBottomSheetState createState() => _AddWalletBottomSheetState();
}

class _AddWalletBottomSheetState extends State<AddWalletBottomSheet> {
  String _mnemonic = "";
  String _alias = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter mnemonic',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _mnemonic = value;
              },
            ),
          ),
          ListTile(
            title: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Enter alias',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                _alias = value;
              },
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(ImportWalletFormData(mnemonic: _mnemonic, alias: _alias)),
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
            ),
            child: const Text('Add wallet'),
          ),
        ],
      ),
    );
  }
}
