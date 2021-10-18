import 'package:alan/alan.dart';
import 'package:alan/transactions/sender/tx_sender.dart';
import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/alan/alan_transaction.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/signed_transaction.dart';
import 'package:transaction_signing_gateway/model/transaction_broadcasting_failure.dart';
import 'package:transaction_signing_gateway/model/transaction_hash.dart';
import 'package:transaction_signing_gateway/transaction_broadcaster.dart';

class AlanTransactionBroadcaster implements TransactionBroadcaster {
  final NetworkInfo _networkInfo;

  AlanTransactionBroadcaster(this._networkInfo);

  @override
  Future<Either<TransactionBroadcastingFailure, TransactionHash>> broadcast({
    required SignedTransaction transaction,
    required PrivateWalletCredentials privateWalletCredentials,
  }) async {
    if (transaction is! SignedAlanTransaction) {
      return left(AlanTransactionBroadcastingFailure('passed transaction is not $SignedAlanTransaction'));
    }
    if (privateWalletCredentials is! AlanPrivateWalletCredentials) {
      return left(AlanTransactionBroadcastingFailure("passed privateCredentials is not $AlanPrivateWalletCredentials"));
    }
    final txSender = TxSender.fromNetworkInfo(_networkInfo);
    final response =
        await txSender.broadcastTx(transaction.signedTransaction, mode: BroadcastMode.BROADCAST_MODE_BLOCK);

    if (response.hasTxhash()) {
      return right(TransactionHash(txHash: response.txhash));
    } else {
      return left(AlanTransactionBroadcastingFailure('Tx error: $response'));
    }
  }

  @override
  bool canBroadcast(SignedTransaction signedTransaction) => signedTransaction is SignedAlanTransaction;
}

class AlanTransactionBroadcastingFailure extends TransactionBroadcastingFailure {
  final Object cause;

  AlanTransactionBroadcastingFailure(this.cause);

  @override
  String toString() {
    return 'AlanTransactionSigningFailure{cause: $cause}';
  }

  @override
  // TODO: implement type
  TransactionBroadcastingFailType get type => TransactionBroadcastingFailType.unknown;
}
