import 'package:cosmos_ui_components/components/empty_list_message.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/pages/mnemonic_onboarding_page.dart';
import 'package:starport_template/pages/wallet_details_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class WalletsListPage extends StatefulWidget {
  const WalletsListPage({
    Key? key,
  }) : super(key: key);

  @override
  _WalletsListPageState createState() => _WalletsListPageState();
}

class _WalletsListPageState extends State<WalletsListPage> {
  List<WalletPublicInfo> get publicInfos => StarportApp.walletsStore.wallets;

  List<WalletInfo> get walletInfos => publicInfos
      .map(
        (publicInfo) => WalletInfo(
          name: publicInfo.name,
          address: publicInfo.publicAddress,
          walletId: publicInfo.walletId,
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    //ignore: deprecated_member_use_from_same_package
    return Scaffold(
      // Not translating this.
      appBar: const CosmosAppBar(
        title: 'Starport',
      ),
      body: Observer(
        builder: (context) => ContentStateSwitcher(
            emptyChild: const EmptyListMessage(
              message: "No wallets found. Add one.",
            ),
            isEmpty: walletInfos.isEmpty,
            contentChild: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CosmosWalletsListView(
                list: walletInfos,
                onClicked: (index) => _walletClicked(index),
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _addWalletClicked(),
        label: const Text("New wallet"),
      ),
    );
  }

  void _addWalletClicked() => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MnemonicOnboardingPage(openWalletsListOnDone: false),
        ),
      );

  void _walletClicked(int index) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => WalletDetailsPage(walletInfo: walletInfos[index]),
        ),
      );
}
