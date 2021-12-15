import 'dart:async';

import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/pages/onboarding_page.dart';
import 'package:starport_template/starport_app.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  State<RoutingPage> createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  @override
  void initState() {
    super.initState();
    _loadWallets();
  }

  Future<void> _loadWallets() async {
    final store = StarportApp.walletsStore;
    await store.loadWallets();
    if (store.loadWalletsFailure.value == null) {
      if (!mounted) {
        return;
      }
      if (store.wallets.isEmpty) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentStateSwitcher(
        isLoading: StarportApp.walletsStore.areWalletsLoading,
        isError: StarportApp.walletsStore.loadWalletsFailure.value != null,
        errorChild: const CosmosErrorView(
          title: 'Something went wrong',
          message: 'We had problems retrieving wallets from secure storage.',
        ),
        contentChild: const SizedBox(),
      ),
    );
  }
}
