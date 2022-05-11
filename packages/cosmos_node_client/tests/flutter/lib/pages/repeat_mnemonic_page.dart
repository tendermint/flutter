import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';
import 'package:starport_template/entities/wallet_additional_data.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/loading_splash.dart';

class RepeatMnemonicPage extends StatefulWidget {
  const RepeatMnemonicPage({
    required this.mnemonic,
    Key? key,
  }) : super(key: key);

  final String mnemonic;

  @override
  State<RepeatMnemonicPage> createState() => _RepeatMnemonicPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('mnemonic', mnemonic));
  }
}

class _RepeatMnemonicPageState extends State<RepeatMnemonicPage> {
  late List<String> _selectedWords;

  List<String> get _mnemonicWords => widget.mnemonic.splitToWords();

  bool get _createButtonEnabled => listEquals(_mnemonicWords, _selectedWords);

  bool get _isLoading => StarportApp.walletsStore.isWalletImporting;

  bool get _isError => StarportApp.walletsStore.isWalletImportingError;

  @override
  void initState() {
    super.initState();
    _selectedWords = [];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ContentStateSwitcher(
        isError: _isError,
        errorChild: _errorUI(),
        isLoading: _isLoading,
        loadingChild: const LoadingSplash(
          text: 'Creating wallet..',
        ),
        contentChild: Scaffold(
          body: _contentUI(),
          appBar: _appBar(),
        ),
      ),
    );
  }

  CosmosAppBar _appBar() {
    return CosmosAppBar(
      leading: const CosmosBackButton(),
      title: 'Confirm recovery phrase',
      actions: [
        CosmosAppBarAction(
          onTap: _onTapAdvanced,
          text: 'Advanced',
        ),
      ],
    );
  }

  void _onTapAdvanced() => notImplemented(context);

  Widget _contentUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: CosmosTheme.of(context).spacingL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: CosmosTheme.of(context).spacingM),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CosmosMnemonicConfirmView(
                      mnemonicWords: _mnemonicWords,
                      onSelectedWordsChanged: _selectedWordsChanged,
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: CosmosTheme.of(context).spacingM),
            CosmosElevatedButton(
              text: 'Create Account',
              onTap: _createButtonEnabled ? _onTapCreateAccount : null,
            )
          ],
        ),
      ),
    );
  }

  Widget _errorUI() {
    return const Center(
      child: Text('Error!'),
    );
  }

  void _selectedWordsChanged(List<String> selectedWords) => setState(() {
        _selectedWords = selectedWords;
      });

  Future<void> _onTapCreateAccount() async {
    final password = await PasswordPromptPage.promptPassword(context);
    if (password == null) {
      return;
    }
    await StarportApp.walletsStore.importAlanWallet(
      ImportWalletFormData(
        name: 'Wallet ${StarportApp.walletsStore.wallets.length}',
        password: password,
        mnemonic: widget.mnemonic,
        additionalData: WalletAdditionalData(isBackedUp: true),
      ),
      onWalletCreationStarted: () => setState(() {}),
    );
    setState(() {});
    if (!mounted) {
      return;
    }
    if (!_isError) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const AssetsPortfolioPage()),
        (route) => false,
      );
    }
  }
}
