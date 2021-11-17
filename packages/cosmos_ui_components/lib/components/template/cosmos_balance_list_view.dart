import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';

class CosmosBalancesListView extends StatelessWidget {
  final List<Balance> list;
  final void Function(int) onClicked;

  const CosmosBalancesListView({
    required this.list,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .mapIndexed(
            (index, balance) => CosmosBalanceCard(
              denomText: balance.denomText,
              amountDisplayText: balance.amountDisplayText,
              onTransferPressed: () {
                onClicked(index);
              },
            ),
          )
          .toList(),
    );
  }
}

class Balance {
  final String denomText;
  final String amountDisplayText;

  Balance({
    required this.denomText,
    required this.amountDisplayText,
  });
}
