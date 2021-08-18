import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/wallet_derivator.dart';
import 'package:alan/alan.dart' as alan;
import 'package:uuid/uuid.dart';

class AlanWalletDerivator implements WalletDerivator {
  @override
  Either<WalletDerivationFailure, PrivateWalletCredentials> derive(
      {required WalletDerivationInfo walletDerivationInfo}) {
    try {
      final alanWalletDerivationInfo = walletDerivationInfo as AlanWalletDerivationInfo;
      final wallet =
          alan.Wallet.derive(alanWalletDerivationInfo.mnemonic.split(" "), alanWalletDerivationInfo.networkInfo);
      return right(AlanPrivateWalletCredentials(
        publicInfo: WalletPublicInfo(
          chainId: 'cosmos',
          walletId: const Uuid().v4(),
          name: alanWalletDerivationInfo.walletAlias,
          publicAddress: wallet.bech32Address,
        ),
        mnemonic: alanWalletDerivationInfo.mnemonic,
        networkInfo: alanWalletDerivationInfo.networkInfo,
      ));
    } catch (ex) {
      return left(InvalidMnemonicFailure(ex.toString()));
    }
  }

  @override
  bool canDerive(WalletDerivationInfo walletDerivationInfo) => walletDerivationInfo is AlanWalletDerivationInfo;
}
