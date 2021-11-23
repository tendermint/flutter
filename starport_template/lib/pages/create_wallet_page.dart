import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/loading_splash.dart';
import 'package:transaction_signing_gateway/storage/biometric_data_store.dart';

class CreateWalletPage extends StatefulWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  _CreateWalletPageState createState() => _CreateWalletPageState();
}

class _CreateWalletPageState extends State<CreateWalletPage> {
  Either<BiometricCredentialsStorageFailure, Unit>? _authenticationResult;

  bool get isLoading => _authenticationResult == null;

  bool get isAuthenticating => _authenticationResult == null;

  @override
  void initState() {
    super.initState();
    _authenticateUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentStateSwitcher(
        isLoading: isLoading,
        errorChild: _errorUI(),
        isError: _authenticationResult?.isRight() == false,
        loadingChild: LoadingSplash(
          text: isAuthenticating ? 'Authenticating..' : 'Creating a recovery phrase..',
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
      leading: const CosmosBackButton(text: "Back"),
      title: "Back up your account",
      actions: [
        CosmosAppBarAction(
          onTap: _onTapAdvanced,
          text: "Advanced",
        ),
      ],
    );
  }

  Widget _contentUI() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: CosmosTheme.of(context).spacingL,
          right: CosmosTheme.of(context).spacingL,
          top: CosmosTheme.of(context).spacingS,
          bottom: CosmosTheme.of(context).spacingXL,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "If your device is lost or stolen, you will be able to recover your account.",
              style: CosmosTextTheme.copy0Normal,
            ),
            SizedBox(height: CosmosTheme.of(context).spacingXL),
            const InfoCard(text: "We will never ask you to share your recovery phrase."),
            SizedBox(height: CosmosTheme.of(context).spacingL),
            const InfoCard(text: "Never share your recovery phrase with anyone, store it securely."),
            SizedBox(height: CosmosTheme.of(context).spacingL),
            const InfoCard(
              text: "If you don’t backup your wallet or lose your recovery phrase, "
                  "you will not able to recover your account",
            ),
            const Spacer(),
            CosmosElevatedButton(text: "Back up now", onTap: _onTapBackUpNow),
            const SizedBox(height: 10),
            CosmosTextButton(text: "Back up later", onTap: _onTapBackUpLater),
          ],
        ),
      ),
    );
  }

  Widget _errorUI() {
    return const Material(
      child: Center(
        child: Text("Error!"),
      ),
    );
  }

  Future<void> _authenticateUser() async {
    final result = await StarportApp.biometricDataStore.authenticateUser();
    setState(() => _authenticationResult = result);
  }

  void _onTapAdvanced() {}

  void _onTapBackUpNow() {}

  void _onTapBackUpLater() {}
}
