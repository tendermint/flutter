import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/pages/receive_money_sheet.dart';
import 'package:starport_template/pages/select_asset_page.dart';
import 'package:starport_template/pages/transaction_history_page.dart';
import 'package:starport_template/pages/wallets_list_sheet.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/asset_portfolio_heading.dart';
import 'package:starport_template/widgets/balance_card_list.dart';
import 'package:starport_template/widgets/starport_button_bar.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class AssetsPortfolioPage extends StatefulWidget {
  const AssetsPortfolioPage({Key? key}) : super(key: key);

  @override
  State<AssetsPortfolioPage> createState() => _AssetsPortfolioPageState();
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
                      _gradientAvatar(context),
                      AssetPortfolioHeading(title: selectedWallet.name, onTap: _onTapDropDown),
                      SizedBox(height: CosmosTheme.of(context).spacingXL),
                      const Divider(),
                      SizedBox(height: CosmosTheme.of(context).spacingL),
                      SizedBox(height: CosmosTheme.of(context).spacingM),
                      BalanceCardList(balancesList: balancesList),
                    ],
                  ),
                  StarportButtonBar(
                    onReceivePressed: _onTapReceive,
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

  Widget _gradientAvatar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          height: 35,
          child: InkWell(
            onTap: () => _onTapAvatar(context),
            child: GradientAvatar(stringKey: selectedWallet.publicAddress),
          ),
        ),
      ),
    );
  }

  void _onTapAvatar(BuildContext context) =>
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TransactionHistoryPage()));

  Future _fetchWalletBalances() async {
    await StarportApp.walletsStore.getBalances(selectedWallet.publicAddress);
  }

  Future<void> _onTapDropDown() async {
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
    }
  }

  void _onTapReceive() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.06,
        child: ReceiveMoneySheet(walletInfo: StarportApp.walletsStore.selectedWallet),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<WalletPublicInfo>('selectedWallet', selectedWallet))
      ..add(DiagnosticsProperty<bool>('isBalancesLoading', isBalancesLoading))
      ..add(DiagnosticsProperty<bool>('isSendMoneyLoading', isSendMoneyLoading))
      ..add(IterableProperty<Balance>('balancesList', balancesList))
      ..add(DiagnosticsProperty<bool>('isError', isError));
  }
}
