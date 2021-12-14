import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/create_wallet_page.dart';
import 'package:starport_template/pages/import_wallet_page.dart';

class OnboardingPage extends StatefulWidget {
  final bool openWalletsListOnDone;

  const OnboardingPage({
    Key? key,
    this.openWalletsListOnDone = true,
  }) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return AnimatedSwitcher(
      duration: const MediumDuration(),
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset("assets/images/welcome-bg.png", fit: BoxFit.cover),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: theme.spacingL,
                  top: theme.spacingL,
                  right: theme.spacingL,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.width + 24,
                    ),
                    Text(
                      "Welcome to your first blockchain-powered mobile app.",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: theme.spacingL),
                    Text(
                      "Access your wallet for alicechain/1.",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: theme.spacingXL),
                    CosmosElevatedButton(
                      text: "Create account",
                      onTap: _onTapCreateAccount,
                    ),
                    SizedBox(height: theme.spacingM),
                    CosmosTextButton(
                      text: "Import account",
                      onTap: _onTapImportAccount,
                    ),
                    const MinimalBottomSpacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapCreateAccount() => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const CreateWalletPage()),
      );

  void _onTapImportAccount() => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ImportWalletPage()),
      );
}
