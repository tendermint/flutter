import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';

abstract class PrivateWalletCredentialsSerializer {
  String get identifier;

  Either<CredentialsStorageFailure, PrivateWalletCredentials> fromJson(Map<String, dynamic> json);

  Either<CredentialsStorageFailure, Map<String, dynamic>> toJson(PrivateWalletCredentials credentials);
}
