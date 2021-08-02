import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/mnemonic_onboarding_page.dart';

class StarportApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starport template',
      theme: CosmosAppTheme.buildAppTheme(),
      home: const MnemonicOnboardingPage(),
    );
  }
}
