import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';

abstract class WalletDerivator {
  Either<WalletDerivationFailure, PrivateWalletCredentials> derive(
      {required WalletDerivationInfo walletDerivationInfo});

  bool canDerive(WalletDerivationInfo walletDerivationInfo);
}

class NotFoundDerivator implements WalletDerivator {
  @override
  bool canDerive(WalletDerivationInfo walletDerivationInfo) => true;

  @override
  Either<WalletDerivationFailure, PrivateWalletCredentials> derive(
          {required WalletDerivationInfo walletDerivationInfo}) =>
      left(const DerivatorNotFoundFailure());
}
