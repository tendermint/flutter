import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/cosmos_elevated_button.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/components/template/cosmos_wallets_list_view.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/send_money_sheet.dart';

class AssetsPortfolioPage extends StatefulWidget {
  final WalletInfo walletInfo;

  const AssetsPortfolioPage({Key? key, required this.walletInfo}) : super(key: key);

  @override
  _AssetsPortfolioPageState createState() => _AssetsPortfolioPageState();
}

class _AssetsPortfolioPageState extends State<AssetsPortfolioPage> {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: CosmosTheme.of(context).spacingL,
                          bottom: CosmosTheme.of(context).spacingL,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: GradientAvatar(stringKey: widget.walletInfo.address),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: CosmosTheme.of(context).spacingL),
                        child: Row(
                          children: [
                            Text(
                              widget.walletInfo.name,
                              style: TextStyle(
                                fontSize: CosmosTheme.of(context).fontSizeXL,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              size: CosmosTheme.of(context).fontSizeXL,
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(padding: EdgeInsets.only(top: CosmosTheme.of(context).spacingXL)),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: balancesList
                              .map(
                                (balance) => CosmosBalanceCard(
                                  denomText: balance.denom.text.toUpperCase(),
                                  amountDisplayText: formatAmount(balance.amount.value.toDouble()),
                                  onTransferPressed: () => _transferPressed(balance),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
                    child: Row(
                      children: [
                        Expanded(
                          child: CosmosElevatedButton(
                            text: 'Receive',
                            onTap: () {},
                          ),
                        ),
                        SizedBox(
                          width: CosmosTheme.of(context).spacingL,
                        ),
                        Expanded(
                          child: CosmosElevatedButton(
                            text: 'Send',
                            onTap: () {},
                          ),
                        ),
                      ],
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

  void _transferPressed(Balance balance) {
    final denom = Denom(balance.denom.text);
    _openSendMoneySheet(denom);
  }

  Future _fetchWalletBalances() async {
    await StarportApp.walletsStore.getBalances(widget.walletInfo.address);
  }

  Future<void> _openSendMoneySheet(Denom denom) async {
    final result = await showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: SendMoneySheet(
          denom: denom,
          walletInfo: widget.walletInfo,
        ),
      ),
    );
    if (result == true) {
      StarportApp.walletsStore.getBalances(widget.walletInfo.address);
    }
  }
}
