import 'package:cosmos_ui_components/components/template/transaction_history_card.dart';
import 'package:cosmos_ui_components/components/template/transaction_history_group_title.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/utils/date_formatter.dart';
import 'package:cosmos_ui_components/utils/group_by_extension.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/transaction.dart';

class TransactionHistoryList extends StatefulWidget {
  final List<Transaction> transactionsList;

  const TransactionHistoryList({Key? key, required this.transactionsList}) : super(key: key);

  @override
  _TransactionHistoryListState createState() => _TransactionHistoryListState();
}

class _TransactionHistoryListState extends State<TransactionHistoryList> {
  late Map<String, List<Transaction>> groupedHistory = {};

  @override
  void initState() {
    super.initState();
    groupedHistory.addAll(widget.transactionsList.groupBy((m) => formatDate(m.date, DateFormatEnum.GroupByMonthYear)));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: groupedHistory.keys.map(
        (groupedMonthYear) {
          final transactionsList = groupedHistory[groupedMonthYear] ?? [];
          return SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TransactionHistoryGroupTitle(title: groupedMonthYear),
                ...transactionsList
                    .map(
                      (transaction) => TransactionHistoryCard(
                        transactionType: transaction.type.toString().split('.')[1],
                        denomText: transaction.denom.text,
                        amountText: transaction.amount.displayText,
                        date: transaction.date,
                        isOutgoing: transaction.type == TransactionType.Send,
                      ),
                    )
                    .toList()
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}

class TransactionHistoryCard extends StatelessWidget {
  const TransactionHistoryCard({
    Key? key,
    required this.isOutgoing,
    required this.transactionType,
    required this.date,
    required this.amountText,
    required this.denomText,
  }) : super(key: key);

  final bool isOutgoing;
  final String transactionType;
  final DateTime date;
  final String amountText;
  final String denomText;

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
                    transactionType,
                    style: CosmosTextTheme.labelS,
                  ),
                  SizedBox(height: theme.spacingXS),
                  Text(
                    formatDate(date, DateFormatEnum.ShortUIDateDay),
                    style: CosmosTextTheme.copyMinus1Normal,
                  ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '${isOutgoing ? '-' : '+'} $amountText',
                    style: CosmosTextTheme.labelS.copyWith(color: isOutgoing ? null : Colors.green),
                  ),
                  SizedBox(height: theme.spacingXS),
                  Text(
                    denomText.toUpperCase(),
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
