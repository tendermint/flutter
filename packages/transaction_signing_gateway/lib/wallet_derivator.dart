import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';

abstract class WalletDerivator {
  Future<Either<WalletDerivationFailure, PrivateWalletCredentials>> derive({
    required WalletDerivationInfo walletDerivationInfo,
  });

  bool canDerive(WalletDerivationInfo walletDerivationInfo);
}

class NotFoundDerivator implements WalletDerivator {
  @override
  bool canDerive(WalletDerivationInfo walletDerivationInfo) => true;

  @override
  Future<Either<WalletDerivationFailure, PrivateWalletCredentials>> derive({
    required WalletDerivationInfo walletDerivationInfo,
  }) async =>
      left(const DerivatorNotFoundFailure());
}
