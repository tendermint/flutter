import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/create_account_page.dart';
import 'package:starport_template/pages/import_account_page.dart';
import 'package:starport_template/starport_app.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({
    this.openAccountsListOnDone = true,
    Key? key,
  }) : super(key: key);

  final bool openAccountsListOnDone;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('openAccountsListOnDone', openAccountsListOnDone));
  }
}

class _OnboardingPageState extends State<OnboardingPage> {
  String get nodeNetwork => StarportApp.settingsStore.nodeNetwork;

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
                      'Access your account for $nodeNetwork.',
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
        MaterialPageRoute(builder: (_) => const CreateAccountPage()),
      );

  void _onTapImportAccount() => Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const ImportAccountPage()),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('nodeNetwork', nodeNetwork));
  }
}
