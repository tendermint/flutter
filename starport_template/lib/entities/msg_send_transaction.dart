import 'package:starport_template/entities/amount.dart';

class MsgSendTransaction {
  final Amount amount;
  final String recipient;
  final double fee;

  MsgSendTransaction({required this.amount, required this.recipient, required this.fee});
}
