import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';

class BalanceCardList extends StatelessWidget {
  final List<Balance> balancesList;

  const BalanceCardList({Key? key, required this.balancesList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: balancesList
            .map(
              (balance) => Column(
                children: [
                  CosmosBalanceCard(
                    denomText: balance.denom.text.toUpperCase(),
                    amountDisplayText: formatAmount(balance.amount.value.toDouble()),
                  ),
                  SizedBox(height: CosmosTheme.of(context).spacingL),
                  SizedBox(height: CosmosTheme.of(context).spacingM),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}
