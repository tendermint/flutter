import 'package:cosmos_ui_components/components/template/transaction_history_card.dart';
import 'package:cosmos_ui_components/components/template/transaction_history_group_title.dart';
import 'package:cosmos_ui_components/models/transaction.dart';
import 'package:cosmos_ui_components/utils/date_formatter.dart';
import 'package:cosmos_ui_components/utils/group_by_extension.dart';
import 'package:flutter/material.dart';

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
                        transaction: transaction,
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
