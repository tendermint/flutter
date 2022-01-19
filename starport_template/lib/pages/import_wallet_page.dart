import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/entities/import_wallet_form_data.dart';
import 'package:starport_template/entities/wallet_additional_data.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/pages/wallet_name_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/loading_splash.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({Key? key}) : super(key: key);

  @override
  State<ImportWalletPage> createState() => _ImportWalletPageState();
}

class _ImportWalletPageState extends State<ImportWalletPage> {
  MnemonicValidationError? _mnemonicValidError;

  String _mnemonic = '';

  bool get isImporting => StarportApp.walletsStore.isWalletImporting;

  bool get _importEnabled => _mnemonicValidError == null && _mnemonic.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Observer(
        builder: (context) => ContentStateSwitcher(
          isLoading: isImporting,
          loadingChild: const LoadingSplash(text: 'Importing..'),
          contentChild: Scaffold(
            appBar: _appBar(),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CosmosTextField(
                      initialText: _mnemonic,
                      onChanged: _onTextChanged,
                      maxLines: 10,
                      minLines: 4,
                      hint: 'Enter your recovery phrase',
                    ),
                    SizedBox(height: CosmosTheme.of(context).spacingL),
                    if (_errorMessage != null)
                      CosmosWarningBox(
                        text: _errorMessage!,
                      ),
                    const Spacer(),
                    CosmosElevatedButton(
                      text: 'Import',
                      onTap: _importEnabled ? _onTapImport : null,
                    ),
                    const MinimalBottomSpacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CosmosAppBar _appBar() {
    return CosmosAppBar(
      leading: const CosmosBackButton(),
      title: 'Import account',
      actions: [
        CosmosAppBarAction(
          onTap: _onTapAdvanced,
          text: 'Advanced',
        ),
      ],
    );
  }

  void _onTapAdvanced() => notImplemented(context);

  Future<void> _onTapImport() async {
    if (StarportApp.walletsStore.wallets.isEmpty) {
      await _importWallet();
    } else {
      final name = await _chooseName();
      if (name != null) {
        await _importWallet(name: name);
      }
    }
  }

  Future<String?> _chooseName() {
    return Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (_) => const WalletNamePage(
          name: '',
          actionTitle: 'Import',
        ),
      ),
    );
  }

  Future<void> _importWallet({String name = 'Account 1'}) async {
    final password = await PasswordPromptPage.promptPassword(context);
    if (password == null) {
      return;
    }
    await StarportApp.walletsStore.importAlanWallet(
      ImportWalletFormData(
        mnemonic: _mnemonic,
        name: name,
        password: password,
        additionalData: WalletAdditionalData(isBackedUp: true),
      ),
    );
    if (StarportApp.walletsStore.isWalletImportingError) {
      _showImportErrorDialog();
    } else if (mounted) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (_) => const AssetsPortfolioPage()),
        (route) => false,
      );
    }
  }

  void _showImportErrorDialog() {
    showCosmosAlertDialog(
      context: context,
      dialogBuilder: (context) => CosmosAlertDialog(
        title: 'Cannot import account',
        message: 'Please check your recovery phrase and try again.',
        actions: [
          CosmosModalAction(
            text: 'Ok',
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  void _onTextChanged(String text) {
    setState(() {
      _mnemonic = text;
      _mnemonicValidError = validateMnemonic(text);
    });
  }

  String? get _errorMessage {
    final error = _mnemonicValidError;
    if (error == null) {
      return null;
    }
    switch (error) {
      case MnemonicValidationError.MnemonicEmpty:
        return 'mnemonic cannot be empty';
      case MnemonicValidationError.InvalidCharacter:
        return 'Invalid character';
      case MnemonicValidationError.WrongNumberOfWords:
        return 'Mnemonic must have at exactly 12 or 24 words';
      case MnemonicValidationError.Unknown:
        return 'Invalid mnemonic';
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isImporting', isImporting));
  }
}
