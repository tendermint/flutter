import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

abstract class KeyInfoStorage {
  Future<Either<CredentialsStorageFailure, PrivateWalletCredentials>> getPrivateCredentials(
    WalletLookupKey walletLookupKey,
  );

  Future<Either<CredentialsStorageFailure, Unit>> savePrivateCredentials({
    required PrivateWalletCredentials walletCredentials,
    required String password,
  });

  Future<Either<CredentialsStorageFailure, Unit>> deleteWalletCredentials({required WalletPublicInfo publicInfo});

  Future<Either<CredentialsStorageFailure, Unit>> updatePublicWalletInfo({
    required WalletPublicInfo info,
  });

  Future<Either<CredentialsStorageFailure, List<WalletPublicInfo>>> getWalletsList();

  Future<Either<TransactionSigningFailure, bool>> verifyLookupKey(WalletLookupKey walletLookupKey);
}
