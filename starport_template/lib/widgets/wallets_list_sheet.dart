import 'package:cosmos_ui_components/components/empty_list_message.dart';
import 'package:cosmos_ui_components/components/template/cosmos_circle_text_button.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class WalletsListSheet extends StatefulWidget {
  const WalletsListSheet({
    Key? key,
  }) : super(key: key);

  @override
  _WalletsListSheetState createState() => _WalletsListSheetState();
}

class _WalletsListSheetState extends State<WalletsListSheet> {
  List<WalletPublicInfo> get publicInfos => StarportApp.walletsStore.wallets;

  WalletPublicInfo get selectedWallet => StarportApp.walletsStore.selectedWallet;

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
    return SafeArea(
      child: Observer(
        builder: (context) => ContentStateSwitcher(
          emptyChild: const EmptyListMessage(
            message: "No wallets found. Add one.",
          ),
          isEmpty: walletInfos.isEmpty,
          contentChild: Padding(
            padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: CosmosTheme.of(context).spacingL),
                SizedBox(height: CosmosTheme.of(context).spacingS),
                _buildTopActions(),
                SizedBox(height: CosmosTheme.of(context).spacingXL),
                SizedBox(height: CosmosTheme.of(context).spacingM),
                // TODO: Add text styles from `CosmosTheme.of(context)`
                Text(
                  'Accounts',
                  style: TextStyle(fontSize: CosmosTheme.of(context).fontSizeXL, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: CosmosTheme.of(context).spacingL),
                _buildMainList(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: CosmosTheme.of(context).spacingL),
                  child: const Divider(),
                ),
                SizedBox(height: CosmosTheme.of(context).spacingL),
                _buildPrimaryBottomActions(context),
                SizedBox(height: CosmosTheme.of(context).spacingM),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildPrimaryBottomActions(BuildContext context) {
    return Column(
      children: [
        CosmosCircleTextButton(onTap: () {}, text: 'Create account', icon: Icons.add),
        SizedBox(height: CosmosTheme.of(context).spacingL),
        CosmosCircleTextButton(onTap: () {}, text: 'Import account', icon: Icons.arrow_downward_sharp),
      ],
    );
  }

  Expanded _buildMainList() {
    return Expanded(
      child: CosmosWalletsListView(
        list: walletInfos,
        selectedWallet: walletInfos.firstWhere((element) => element.address == selectedWallet.publicAddress),
        onClicked: (index) => _walletClicked(index),
      ),
    );
  }

  Row _buildTopActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        // TODO: Add text styles from `CosmosTheme.of(context)`
        Text('Edit', style: TextStyle(fontWeight: FontWeight.w500)),
        Text('Close', style: TextStyle(fontWeight: FontWeight.w500)),
      ],
    );
  }

  // TODO: Uncomment this when implementing Send/Receive
  // void _addWalletClicked() => Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => const OnboardingPage(),
  //       ),
  //     );

  void _walletClicked(int index) => Navigator.of(context).pop(publicInfos[index]);
}