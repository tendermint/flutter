// import 'package:cosmos_ui_components/components/template/cosmos_balance_card.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';

class BalanceCardList extends StatelessWidget {
  final List<Balance> balancesList;
  final Function(Balance)? onItemTapped;

  const BalanceCardList({Key? key, required this.balancesList, this.onItemTapped}) : super(key: key);

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
                    onTap: onItemTapped == null ? null : () => onItemTapped!(balance),
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

class CosmosBalanceCard extends StatelessWidget {
  final String denomText;
  final String amountDisplayText;
  final VoidCallback? onTap;
  final bool isListTileType;

  const CosmosBalanceCard({
    required this.denomText,
    required this.amountDisplayText,
    this.isListTileType = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: CosmosTheme.of(context).spacingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 33,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        foregroundColor: Colors.black,
                        child: Text(denomText[0].toUpperCase()),
                      ),
                    ),
                    SizedBox(width: CosmosTheme.of(context).spacingM),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          denomText,
                          style: CosmosTextTheme.title0Medium,
                        ),
                        if (isListTileType)
                          Text(
                            '$amountDisplayText ${denomText.toUpperCase()} available',
                            style: CosmosTextTheme.copyMinus1Normal,
                          ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            if (!isListTileType)
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    amountDisplayText,
                    style: CosmosTextTheme.labelS,
                  ),
                  Text(
                    'available ${denomText.toUpperCase()}',
                    style: CosmosTextTheme.copyMinus1Normal,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
