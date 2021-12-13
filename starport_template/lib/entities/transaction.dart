import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/denom.dart';

enum TransactionType {
  Receive,
  Send,
}

class Transaction {
  final TransactionType type;
  final DateTime date;
  final Amount amount;
  final Denom denom;

  Transaction({
    required this.denom,
    required this.amount,
    required this.date,
    required this.type,
  });
}
