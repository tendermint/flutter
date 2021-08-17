import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/network_info.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';

abstract class WalletDerivator {
  Either<WalletDerivationFailure, PrivateWalletCredentials> derive({
    required String mnemonic,
    required String walletAlias,
    required NetworkInfo networkInfo,
  });
}
