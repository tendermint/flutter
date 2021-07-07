import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/transaction_signing_failure.dart';

abstract class PrivateWalletCredentialsSerializer {
  String get identifier;

  Either<TransactionSigningFailure, PrivateWalletCredentials> fromJson(Map<String, dynamic> json);

  Either<TransactionSigningFailure, Map<String, dynamic>> toJson(PrivateWalletCredentials credentials);
}
