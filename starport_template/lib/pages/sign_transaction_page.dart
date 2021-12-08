import 'package:cosmos_ui_components/components/cosmos_app_bar.dart';
import 'package:cosmos_ui_components/components/cosmos_back_button.dart';
import 'package:cosmos_ui_components/components/cosmos_divider.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/msg_send_transaction.dart';
import 'package:starport_template/pages/assets_portfolio_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/assets_transfer_sheet.dart';
import 'package:starport_template/widgets/sign_transaction_tab_view_item.dart';

class SignTransactionPage extends StatelessWidget {
  final MsgSendTransaction transaction;
  final Balance balance;

  const SignTransactionPage({Key? key, required this.transaction, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: const CosmosAppBar(
        leading: CosmosBackButton(),
        title: 'Sign Transaction',
      ),
      body: Column(
        children: [
          SizedBox(height: theme.spacingXXL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          SignTransactionTabViewItem(text: 'Send', amount: transaction.amount.value.toDouble(), balance: balance),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          SignTransactionTabViewItem(
            text: 'Recipient will get',
            amount: transaction.amount.value.toDouble() - transaction.fee,
            balance: balance,
          ),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          _transactionFee(theme),
          const Spacer(),
          _footerButton(theme, context),
        ],
      ),
    );
  }

  SafeArea _footerButton(CosmosThemeData theme, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
        child: Row(
          children: [
            Expanded(
              child: CosmosElevatedButton(
                text: 'Tap to sign',
                prefixIcon: Image.asset('assets/images/face_id.png'),
                onTap: () async {
                  StarportApp.walletsStore.sendTokens(
                    info: StarportApp.walletsStore.selectedWallet,
                    balance: Balance(
                      amount: transaction.amount,
                      denom: balance.denom,
                    ),
                    toAddress: transaction.recipient,
                    password: '',
                  );
                  showMaterialModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height / 2.24,
                      child: AssetsTransferSheet(
                        onTapDone: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const AssetsPortfolioPage()),
                          (Route<dynamic> route) => false,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _transactionFee(CosmosThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Transaction fee', style: CosmosTextTheme.titleS),
          Text(
            '${transaction.fee.toString()} ${balance.denom.text.toUpperCase()}',
            style: CosmosTextTheme.copyMinus1Normal,
          ),
        ],
      ),
    );
  }
}
