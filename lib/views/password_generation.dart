import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/helpers/mnemonic_encryptor.dart';
import 'package:flutter_app/presentation/wallets_list/wallets_list_initial_params.dart';
import 'package:flutter_app/ui/pages/wallets_list/wallets_list_page.dart';
import 'package:flutter_app/utils/strings.dart';

class PasswordGenerationPage extends StatefulWidget {
  final String? mnemonic;

  const PasswordGenerationPage({this.mnemonic});

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
        title: Text(strings.passwordGeneration),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextFormField(
                obscureText: isPasswordVisible,
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: strings.enterPassword,
                  helperText: strings.passwordHelperText,
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
        onPressed: widget.mnemonic != null
            ? () async {
                await encryptMnemonic(context);
              }
            : () async {
                final mnemonic = await MnemonicEncryptor.decryptMnemonic(passwordController.text);
                cosmosApi.importWallet(
                  mnemonicString: mnemonic,
                  walletAlias: 'First wallet',
                );

                ethApi.importWallet(
                  mnemonicString: mnemonic,
                  walletAlias: 'Another wallet',
                );
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WalletsListPage(initialParams: WalletsListInitialParams()),
                  ),
                );
              },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  Future<void> encryptMnemonic(BuildContext context) async {
    await MnemonicEncryptor.encryptMnemonic(widget.mnemonic!, passwordController.text);
    cosmosApi.importWallet(
      mnemonicString: widget.mnemonic!,
      walletAlias: 'First wallet',
    );

    ethApi.importWallet(
      mnemonicString: widget.mnemonic!,
      walletAlias: 'Another wallet',
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const WalletsListPage(initialParams: WalletsListInitialParams()),
      ),
    );
  }
}
