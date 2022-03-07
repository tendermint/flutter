import 'dart:async';

import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/pages/onboarding_page.dart';
import 'package:starport_template/pages/passcode_prompt_page.dart';
import 'package:starport_template/starport_app.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  bool get isLoading => StarportApp.accountsStore.areAccountsLoading || !StarportApp.settingsStore.isInitialized;

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentStateSwitcher(
        isLoading: isLoading,
        isError: StarportApp.accountsStore.loadAccountsFailure.value != null,
        errorChild: const CosmosErrorView(
          title: 'Something went wrong',
          message: 'We had problems retrieving accounts from secure storage.',
        ),
        contentChild: const SizedBox(),
      ),
    );
  }

  Future<void> initialize() async {
    await _initSettings();
    await _loadAccounts();
    await _performRouting();
  }

  Future<void> _initSettings() => StarportApp.settingsStore.init();

  Future<void> _loadAccounts() async {
    final store = StarportApp.accountsStore;
    await store.loadAccounts();
  }

  Future<void> _performRouting() async {
    if (StarportApp.accountsStore.loadAccountsFailure.value != null || !(await _isPasscodeValid()) || !mounted) {
      return;
    }
    if (StarportApp.accountsStore.accounts.isEmpty) {
      unawaited(
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const OnboardingPage()),
        ),
      );
    } else {
      unawaited(
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const AssetsPortfolioPage()),
        ),
      );
    }
  }

  Future<bool> _isPasscodeValid() async {
    if (!mounted) {
      return false;
    }
    if (StarportApp.settingsStore.appLockEnabled) {
      final result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => const PasswordPromptPage(setUpPasscode: false)),
      );
      return result != null;
    }
    return true;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isLoading', isLoading));
  }
}
