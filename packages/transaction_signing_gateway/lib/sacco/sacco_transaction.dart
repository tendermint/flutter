import 'package:sacco/sacco.dart' as sacco;
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';

class SaccoTransaction implements UnsignedTransaction, SignedTransaction {
  final sacco.StdTx stdTx;

  SaccoTransaction(this.stdTx);
}
