import 'package:starport_template/entities/amount.dart';

class MsgSendTransaction {
  MsgSendTransaction({required this.amount, required this.recipient, required this.fee});

  final Amount amount;
  final String recipient;
  final double fee;
}
