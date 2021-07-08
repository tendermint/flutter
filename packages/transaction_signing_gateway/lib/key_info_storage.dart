import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';

abstract class KeyInfoStorage {
  Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> getPrivateCredentials({
    required String chainId,
    required String walletId,
    required String password,
  });

  Future<Either<CredentialsStorageFailure, Unit>> savePrivateCredentials({
    required PrivateWalletCredentials walletCredentials,
    required String password,
  });
}
