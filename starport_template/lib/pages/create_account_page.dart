import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/pages/back_up_account_page.dart';
import 'package:starport_template/pages/backup_later_bottom_sheet.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/loading_splash.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool? _isAuthenticated;

  String? _mnemonic;

  bool get isLoading =>
      _isAuthenticated == null ||
      StarportApp.accountsStore.isMnemonicCreating ||
      StarportApp.accountsStore.isAccountImporting;

  bool get isError =>
      !(_isAuthenticated ?? true) ||
      StarportApp.accountsStore.isMnemonicCreatingError ||
      StarportApp.accountsStore.isAccountImportingError;

  bool get isAuthenticating => _isAuthenticated == null;

  bool get isMnemonicCreating => StarportApp.accountsStore.isMnemonicCreating;

  bool get isAccountImporting => StarportApp.accountsStore.isAccountImporting;

  bool get isMnemonicCreatingError => StarportApp.accountsStore.isMnemonicCreatingError;

  bool get isAccountImportingError => StarportApp.accountsStore.isAccountImportingError;

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ContentStateSwitcher(
        isLoading: isLoading,
        errorChild: _errorUI(),
        isError: isError,
        loadingChild: LoadingSplash(
          text: isAuthenticating
              ? 'Authenticating..'
              : (isMnemonicCreating ? 'Creating a recovery phrase..' : 'Creating account..'),
        ),
        contentChild: Scaffold(
          backgroundColor: CosmosTheme.of(context).colors.background,
          body: _contentUI(),
          appBar: _appBar(),
        ),
      ),
    );
  }

  CosmosAppBar _appBar() {
    return CosmosAppBar(
      leading: const CosmosBackButton(),
      title: 'Back up your account',
      actions: [
        CosmosAppBarAction(
          onTap: _onTapAdvanced,
          text: 'Advanced',
        ),
      ],
    );
  }

  Widget _contentUI() {
    final theme = CosmosTheme.of(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: theme.spacingL,
          right: theme.spacingL,
          top: theme.spacingS,
          bottom: theme.spacingXL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'If your device is lost or stolen, you will be able to recover your account.',
              style: CosmosTextTheme.copy0Normal,
            ),
            SizedBox(height: theme.spacingXL),
            const InfoCard(text: 'We will never ask you to share your recovery phrase.'),
            SizedBox(height: theme.spacingL),
            const InfoCard(text: 'Never share your recovery phrase with anyone, store it securely.'),
            SizedBox(height: theme.spacingL),
            const InfoCard(
              text: 'If you don’t backup your account or lose your recovery phrase, '
                  'you will not able to recover your account',
            ),
            const Spacer(),
            CosmosElevatedButton(text: 'Back up now', onTap: _onTapBackUpNow),
            SizedBox(height: theme.spacingM),
            CosmosTextButton(text: 'Back up later', onTap: _onTapBackUpLater),
            const MinimalBottomSpacer(),
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

  Future<void> _authenticateUser() async {
    final result = await StarportApp.cosmosAuth.biometricAuthenticate();
    setState(
      () => _isAuthenticated = result.fold(
        (fail) => fail.type == LocalAuthFailureType.noBiometrics,
        (isAuthenticated) => isAuthenticated,
      ),
    );
  }

  void _onTapAdvanced() => notImplemented(context);

  Future<void> _onTapBackUpNow() async {
    _mnemonic ??= await StarportApp.accountsStore.createMnemonic();
    final mnemonic = _mnemonic;
    if (mnemonic == null) {
      return;
    }
    if (mounted) {
      await Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => BackUpAccountPage(mnemonic: mnemonic)),
      );
    }
  }

  void _onTapBackUpLater() => showMaterialModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BackupLaterBottomSheet(
          onTapSkipBackup: () => _createAccount(isBackedUp: false),
        ),
      );

  Future<void> _createAccount({required bool isBackedUp}) async {
    final password = await PasswordPromptPage.promptPassword(
      context,
    );
    if (password == null) {
      return;
    }
    await StarportApp.accountsStore.createNewAccount(
      password: password,
      isBackedUp: isBackedUp,
      onMnemonicGenerationStarted: () => setState(() {}),
      onAccountCreationStarted: () => setState(() {}), //this will cause the loading message to update
    );
    if (mounted) {
      await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => const AssetsPortfolioPage(),
        ),
        (route) => false,
      );
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isMnemonicCreatingError', isMnemonicCreatingError))
      ..add(DiagnosticsProperty<bool>('isMnemonicCreating', isMnemonicCreating))
      ..add(DiagnosticsProperty<bool>('isAccountImporting', isAccountImporting))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading))
      ..add(DiagnosticsProperty<bool>('isAuthenticating', isAuthenticating))
      ..add(DiagnosticsProperty<bool>('isAccountImportingError', isAccountImportingError))
      ..add(DiagnosticsProperty<bool>('isError', isError));
  }
}
