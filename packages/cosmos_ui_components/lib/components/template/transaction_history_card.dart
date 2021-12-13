import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/models/transaction.dart';
import 'package:cosmos_ui_components/utils/date_formatter.dart';
import 'package:flutter/material.dart';

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({
    Key? key,
    required this.isOutgoing,
    required this.transaction,
  }) : super(key: key);

  final bool isOutgoing;
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                isOutgoing ? 'assets/images/send_icon.png' : 'assets/images/receive_icon.png',
                package: packageName,
              ),
              SizedBox(width: theme.spacingL),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transaction.type.toString().split('.')[1],
                    style: CosmosTextTheme.labelS,
                  ),
                  SizedBox(height: theme.spacingXS),
                  Text(
                    formatDate(transaction.date, DateFormatEnum.ShortUIDateDay),
                    style: CosmosTextTheme.copyMinus1Normal,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isOutgoing ? '-' : '+'} ${transaction.balance.amountDisplayText}',
                    style: CosmosTextTheme.labelS.copyWith(color: isOutgoing ? null : Colors.green),
                  ),
                  SizedBox(height: theme.spacingXS),
                  Text(
                    transaction.balance.denomText.toUpperCase(),
                    style: CosmosTextTheme.copyMinus1Normal,
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
