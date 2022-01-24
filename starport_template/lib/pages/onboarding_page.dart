import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/create_wallet_page.dart';
import 'package:starport_template/pages/import_wallet_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    this.openWalletsListOnDone = true,
    Key? key,
  }) : super(key: key);

  final bool openWalletsListOnDone;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('openWalletsListOnDone', openWalletsListOnDone));
  }
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
              child: Image.asset('assets/images/welcome-bg.png', fit: BoxFit.cover),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(
                  left: theme.spacingL,
                  top: theme.spacingL,
                  right: theme.spacingL,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Welcome to your first blockchain-powered mobile app.',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: theme.spacingL),
                    Text(
                      'Access your wallet for alicechain/1.',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    SizedBox(height: theme.spacingXL),
                    CosmosElevatedButton(
                      text: 'Create account',
                      onTap: _onTapCreateAccount,
                    ),
                    SizedBox(height: theme.spacingM),
                    CosmosTextButton(
                      text: 'Import account',
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
