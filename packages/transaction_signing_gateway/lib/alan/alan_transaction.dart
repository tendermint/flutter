import 'package:alan/alan.dart' as alan;
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/unsigned_transaction.dart';

class AlanTransaction implements UnsignedTransaction, SignedTransaction {
  final alan.Tx stdTx;

  AlanTransaction(this.stdTx);
}
