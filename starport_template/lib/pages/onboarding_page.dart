import 'package:cosmos_ui_components/cosmos_theme.dart';
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
                padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
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
                    const SizedBox(height: 18),
                    Text(
                      "Access your wallet for alicechain/1.",
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 38),
                    CosmosElevatedButton(
                      text: "Create account",
                      onTap: _onTapCreateAccount,
                    ),
                    const SizedBox(height: 10),
                    CosmosTextButton(
                      text: "Import account",
                      onTap: _onTapImportAccount,
                    ),
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
