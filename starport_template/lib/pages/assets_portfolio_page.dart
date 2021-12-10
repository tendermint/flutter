import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/pages/select_asset_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/asset_portfolio_heading.dart';
import 'package:starport_template/widgets/balance_card_list.dart';
import 'package:starport_template/widgets/receive_money_sheet.dart';
import 'package:starport_template/widgets/starport_button_bar.dart';
import 'package:starport_template/widgets/wallets_list_sheet.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class AssetsPortfolioPage extends StatefulWidget {
  const AssetsPortfolioPage({Key? key}) : super(key: key);

  @override
  _AssetsPortfolioPageState createState() => _AssetsPortfolioPageState();
}

class _AssetsPortfolioPageState extends State<AssetsPortfolioPage> {
  ObservableList<Balance> get balancesList => StarportApp.walletsStore.balancesList;

  bool get isBalancesLoading => StarportApp.walletsStore.isBalancesLoading;

  bool get isSendMoneyLoading => StarportApp.walletsStore.isSendMoneyLoading;

  bool get isError => StarportApp.walletsStore.isBalancesLoadingError;

  WalletPublicInfo get selectedWallet => StarportApp.walletsStore.selectedWallet;

  @override
  void initState() {
    super.initState();
    _fetchWalletBalances();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Observer(
            builder: (context) => ContentStateSwitcher(
              contentChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      _buildGradientAvatar(context),
                      AssetPortfolioHeading(title: selectedWallet.name, onTap: _onDropDownTapped),
                      SizedBox(height: CosmosTheme.of(context).spacingXL),
                      const Divider(),
                      SizedBox(height: CosmosTheme.of(context).spacingL),
                      SizedBox(height: CosmosTheme.of(context).spacingM),
                      BalanceCardList(balancesList: balancesList),
                    ],
                  ),
                  StarportButtonBar(
                    onReceivePressed: _onReceivePressed,
                    onSendPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) => SelectAssetPage(balancesList: balancesList)));
                    },
                  ),
                ],
              ),
              isLoading: isBalancesLoading,
              isError: isError,
              errorChild: const Center(child: Text('An unexpected error occurred')),
            ),
          ),
        ),
      ),
    );
  }

  Padding _buildGradientAvatar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(height: 35, child: GradientAvatar(stringKey: selectedWallet.publicAddress)),
      ),
    );
  }

  Future _fetchWalletBalances() async {
    await StarportApp.walletsStore.getBalances(selectedWallet.publicAddress);
  }

  Future<void> _onDropDownTapped() async {
    final wallet = await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.06,
        child: const WalletsListSheet(),
      ),
    ) as WalletPublicInfo?;

    if (wallet != null) {
      StarportApp.walletsStore.selectWallet(wallet);
      _fetchWalletBalances();
    }
  }

  void _onReceivePressed() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.06,
        child: ReceiveMoneySheet(walletInfo: StarportApp.walletsStore.selectedWallet),
      ),
    );
  }
}
