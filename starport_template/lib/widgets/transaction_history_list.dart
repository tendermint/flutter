import 'package:cosmos_ui_components/components/template/transaction_history_card.dart';
import 'package:cosmos_ui_components/components/template/transaction_history_group_title.dart';
import 'package:cosmos_ui_components/utils/date_formatter.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/transaction_history_item.dart';

class TransactionHistoryList extends StatefulWidget {
  final List<TransactionHistoryItem> transactionsList;

  const TransactionHistoryList({Key? key, required this.transactionsList}) : super(key: key);

  @override
  _TransactionHistoryListState createState() => _TransactionHistoryListState();
}

class _TransactionHistoryListState extends State<TransactionHistoryList> {
  late Map<String, List<TransactionHistoryItem>> groupedHistory = {};

  @override
  void initState() {
    super.initState();
    groupedHistory.addAll(widget.transactionsList.groupBy((m) => formatDate(m.date, DateFormatEnum.groupByMonthYear)));
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
                TransactionHistoryGroupTitle(title: extractMonth(groupedMonthYear)),
                ...transactionsList
                    .map(
                      (transaction) => TransactionHistoryCard(
                        transactionType: transaction.transactionType,
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
