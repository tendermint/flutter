import 'package:cosmos_ui_components/models/balance.dart';

enum TransactionType {
  Receive,
  Send,
}

class Transaction {
  final TransactionType type;
  final DateTime date;
  Balance balance;

  Transaction({
    required this.balance,
    required this.date,
    required this.type,
  });
}
