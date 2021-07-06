import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';

abstract class KeyInfoStorage {
  Future<Either<TransactionSigningFailure, PrivateWalletCredentials>> getPrivateCredentials({
    required String chainId,
    required String walletId,
    required String password,
  });

  Future<Either<TransactionSigningFailure, Unit>> savePrivateCredentials({
    required PrivateWalletCredentials walletCredentials,
    required String password,
  });
}
