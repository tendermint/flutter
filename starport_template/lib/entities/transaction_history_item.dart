import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/denom.dart';

enum TransactionType {
  Receive,
  Send,
}

class TransactionHistoryItem {
  final TransactionType type;
  final DateTime date;
  final Amount amount;
  final Denom denom;

  TransactionHistoryItem({
    required this.denom,
    required this.amount,
    required this.date,
    required this.type,
  });

  String get transactionType => type.toString().split('.')[1];
}
