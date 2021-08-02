import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/starport_app.dart';

class RoutingPage extends StatefulWidget {
  const RoutingPage({Key? key}) : super(key: key);

  @override
  _RoutingPageState createState() => _RoutingPageState();
}

class _RoutingPageState extends State<RoutingPage> {
  @override
  void initState() {
    super.initState();
    final loadWallets = StarportApp.walletsStore.loadWallets();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ContentStateSwitcher(
        isLoading: StarportApp.walletsStore.areWalletsLoading.value,
        isError: StarportApp.walletsStore..loadWalletsFailure.value != null,
        contentChild: SizedBox(),
        emptyChild:,
      ),
    );
  }
}
