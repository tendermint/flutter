import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';
import 'package:starport_template/pages/add_wallet_bottom_sheet.dart';
import 'package:starport_template/pages/wallets_list_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/password_setup_sheet.dart';

class MnemonicOnboardingPage extends StatefulWidget {
  final bool openWalletsListOnDone;

  const MnemonicOnboardingPage({
    Key? key,
    this.openWalletsListOnDone = true,
  }) : super(key: key);

  @override
  _MnemonicOnboardingPageState createState() => _MnemonicOnboardingPageState();
}

class _MnemonicOnboardingPageState extends State<MnemonicOnboardingPage> {
  String mnemonic = "";

  List<String> get mnemonicWords => mnemonic.trim().split(' ');

  bool get isLoading => StarportApp.walletsStore.isWalletImporting;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CosmosAppBar(
        title: "Wallet Creation",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CosmosAppTheme.spacingM),
          child: Observer(
            builder: (context) => ContentStateSwitcher(
              isEmpty: mnemonic.isEmpty,
              isLoading: isLoading,
              emptyChild: SizedBox.expand(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CosmosElevatedButton(
                      onTap: _generateMnemonicClicked,
                      text: "Create new Wallet",
                    ),
                    CosmosElevatedButton(
                      onTap: _importExistingWalletClicked,
                      text: "Import existing Wallet",
                    ),
                  ],
                ),
              ),
              contentChild: Center(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const SizedBox(height: CosmosAppTheme.spacingM),
                            const Text(
                              'Be sure to write your mnemonic pass phrase in a safe place. '
                              'This phrase is the only way to recover your account if you forget your password. ',
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: CosmosAppTheme.spacingM),
                            Flexible(
                              child: CosmosMnemonicWordsGrid(
                                mnemonicWords: mnemonicWords,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ),
                            const SizedBox(height: CosmosAppTheme.spacingM),
                          ],
                        ),
                      ),
                    ),
                    CosmosElevatedButton(
                      onTap: _proceedClicked,
                      text: "Proceed",
                      suffixIcon: const Icon(Icons.arrow_forward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _generateMnemonicClicked() => setState(() => mnemonic = generateMnemonic());

  void _importExistingWalletClicked() => showModalBottomSheet(
        context: context,
        builder: (context) => AddWalletBottomSheet(importClicked: _importWallet),
      );

  void _proceedClicked() => showModalBottomSheet(
        context: context,
        builder: (context) => PasswordSetupSheet(
          submitClicked: submitPasswordClicked,
        ),
      );

  Future submitPasswordClicked(String password, String name) async => _importWallet(ImportWalletFormData(
        mnemonic: mnemonic.trim(),
        name: name,
        password: password,
      ));

  Future<void> _importWallet(ImportWalletFormData data) async {
    await StarportApp.walletsStore.importAlanWallet(data);
    _openWalletsList();
  }

  void _openWalletsList() {
    if (!mounted) {
      return;
    }
    Navigator.of(context)..pop();
    if (widget.openWalletsListOnDone) {
      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const WalletsListPage()));
    }
  }
}
