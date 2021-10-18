import 'package:alan/alan.dart' as alan;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/alan/alan_wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/wallet_derivator.dart';
import 'package:uuid/uuid.dart';

class AlanWalletDerivator implements WalletDerivator {
  @override
  Future<Either<WalletDerivationFailure, PrivateWalletCredentials>> derive({
    required WalletDerivationInfo walletDerivationInfo,
  }) async {
    try {
      final alanWalletDerivationInfo = walletDerivationInfo as AlanWalletDerivationInfo;
      final wallet = await compute(_deriveWalletSync, alanWalletDerivationInfo);
      return right(
        AlanPrivateWalletCredentials(
          publicInfo: WalletPublicInfo(
            chainId: alanWalletDerivationInfo.chainId,
            walletId: const Uuid().v4(),
            name: alanWalletDerivationInfo.walletAlias,
            publicAddress: wallet.bech32Address,
          ),
          mnemonic: alanWalletDerivationInfo.mnemonic,
        ),
      );
    } catch (ex) {
      return left(InvalidMnemonicFailure(ex.toString()));
    }
  }

  @override
  bool canDerive(WalletDerivationInfo walletDerivationInfo) => walletDerivationInfo is AlanWalletDerivationInfo;
}

alan.Wallet _deriveWalletSync(AlanWalletDerivationInfo derivationInfo) => alan.Wallet.derive(
      derivationInfo.mnemonic.split(" "),
      derivationInfo.networkInfo,
    );
