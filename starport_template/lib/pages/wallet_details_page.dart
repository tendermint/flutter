import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/components/template/cosmos_balance_heading.dart';
import 'package:cosmos_ui_components/components/template/cosmos_wallets_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/starport_app.dart';

// TODO: Remove this aftert [AssetsPortfolioPage] is finalized

class WalletDetailsPage extends StatefulWidget {
  const WalletDetailsPage({
    required this.walletInfo,
    Key? key,
  }) : super(key: key);

  final WalletInfo walletInfo;

  @override
  State<WalletDetailsPage> createState() => _WalletDetailsPageState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<WalletInfo>('walletInfo', walletInfo));
  }
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
                  const BalanceHeading(),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: balancesList
                          .map(
                            (balance) => CosmosBalanceCard(
                              denomText: balance.denom.text,
                              amountDisplayText: balance.amount.value.toString(),
                              secondaryText: 'available ${balance.denom.text.toUpperCase()}',
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  if (isSendMoneyLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 8),
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<bool>('isBalancesLoading', isBalancesLoading))
      ..add(IterableProperty<Balance>('balancesList', balancesList))
      ..add(DiagnosticsProperty<bool>('isSendMoneyLoading', isSendMoneyLoading))
      ..add(DiagnosticsProperty<bool>('isError', isError));
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
