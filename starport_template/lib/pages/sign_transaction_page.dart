import 'package:cosmos_ui_components/components/cosmos_app_bar.dart';
import 'package:cosmos_ui_components/components/cosmos_back_button.dart';
import 'package:cosmos_ui_components/components/cosmos_divider.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/transaction.dart';
import 'package:starport_template/widgets/sign_transaction_item.dart';

class SignTransactionPage extends StatelessWidget {
  final Transaction transaction;
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
          SignTransactionItem(text: 'Send', amount: transaction.amount, balance: balance),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          SignTransactionItem(
            text: 'Recipient will get',
            amount: transaction.amount - transaction.fee,
            balance: balance,
          ),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          _buildTransactionFee(theme),
          const Spacer(),
          _buildFooterButton(theme),
        ],
      ),
    );
  }

  SafeArea _buildFooterButton(CosmosThemeData theme) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
        child: Row(
          children: [
            Expanded(
              child: CosmosElevatedButton(
                text: 'Tap to sign',
                prefixIcon: Image.asset('assets/images/face_id.png'),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding _buildTransactionFee(CosmosThemeData theme) {
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
