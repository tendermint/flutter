import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/components/template/cosmos_balance_heading.dart';
import 'package:cosmos_ui_components/components/template/cosmos_wallets_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/starport_app.dart';

// TODO: Remove this aftert [AssetsPortfolioPage] is finalized

class WalletDetailsPage extends StatefulWidget {
  final WalletInfo walletInfo;

  const WalletDetailsPage({Key? key, required this.walletInfo}) : super(key: key);

  @override
  _WalletDetailsPageState createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends State<WalletDetailsPage> {
  ObservableList<Balance> get balancesList => StarportApp.walletsStore.balancesList;

  bool get isBalancesLoading => StarportApp.walletsStore.isBalancesLoading;

  bool get isSendMoneyLoading => StarportApp.walletsStore.isSendMoneyLoading;

  bool get isError => StarportApp.walletsStore.isBalancesLoadingError;

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
                children: [
                  ListTile(
                    title: const Text('Wallet address'),
                    subtitle: Text(widget.walletInfo.address),
                  ),
                  const Divider(),
                  const Padding(padding: EdgeInsets.only(top: 16)),
                  BalanceHeading(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: balancesList
                          .map(
                            (balance) => CosmosBalanceCard(
                              denomText: balance.denom.text,
                              amountDisplayText: balance.amount.value.toString(),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (isSendMoneyLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Center(
                        child: Text(
                          'Sending money',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
              isLoading: isBalancesLoading,
              isError: isError,
              errorChild: const Center(
                child: Text('An unexpected error occurred'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future _fetchWalletBalances() async {
    await StarportApp.walletsStore.getBalances(widget.walletInfo.address);
  }

// TODO: Remove these functions after [AssetsPortfolioPage] is finalized

// void _transferPressed(Balance balance) {
//   final denom = Denom(balance.denom.text);
//   _openSendMoneySheet(denom);
// }

// Future<void> _openSendMoneySheet(Denom denom) async {
//   final result = await showModalBottomSheet(
//     context: context,
//     builder: (context) => SafeArea(
//       child: SendMoneySheet(
//         denom: denom,
//         walletInfo: widget.walletInfo,
//       ),
//     ),
//   );
//   if (result == true) {
//     StarportApp.walletsStore.getBalances(widget.walletInfo.address);
//   }
// }
}
