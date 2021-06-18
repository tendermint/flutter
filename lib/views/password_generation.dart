import 'package:flutter/material.dart';
import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/helpers/mnemonic_encryptor.dart';
import 'package:flutter_app/views/wallet_list.dart';

class PasswordGenerationPage extends StatefulWidget {
  final String? mnemonic;

  PasswordGenerationPage({this.mnemonic});

  @override
  _PasswordGenerationPageState createState() => _PasswordGenerationPageState();
}

class _PasswordGenerationPageState extends State<PasswordGenerationPage> {
  bool isPasswordVisible = true;
  IconData visibility = Icons.visibility;
  IconData invisibility = Icons.visibility_off;

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password generation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                obscureText: isPasswordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  helperText:
                      'This password will be used to recover your account every time you log in to the app',
                  helperMaxLines: 3,
                  suffixIcon: InkWell(
                    onTap: () {
                      isPasswordVisible = !isPasswordVisible;
                      setState(() {});
                    },
                    child: Icon(isPasswordVisible ? visibility : invisibility),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward),
        onPressed: widget.mnemonic != null ? () async {
          await encryptMnemonic(context);
        } : () async {
          var mnemonic = await MnemonicEncryptor.decryptMnemonic(passwordController.text);
          WalletApi api = WalletApi();
          api.importWallet(
            mnemonicString: mnemonic,
            walletAlias: 'Tendermint',
          );
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => WalletListingPage(),
            ),
          );
        },
      ),
    );
  }

  Future<void> encryptMnemonic(BuildContext context) async {
    await MnemonicEncryptor.encryptMnemonic(
        widget.mnemonic!, passwordController.text);
    WalletApi api = WalletApi();
    api.importWallet(
      mnemonicString: widget.mnemonic!,
      walletAlias: 'Tendermint',
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WalletListingPage(),
      ),
    );
  }
}
