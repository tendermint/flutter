import 'package:dartz/dartz.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/network_info.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/wallet_derivator.dart';
import 'package:alan/alan.dart' as alan;
import 'package:uuid/uuid.dart';

class AlanWalletDerivator implements WalletDerivator {
  @override
  Either<WalletDerivationFailure, PrivateWalletCredentials> derive({
    required String mnemonic,
    required NetworkInfo networkInfo,
    required String walletAlias,
  }) {
    try {
      final alanNetworkInfo = alan.NetworkInfo(
        bech32Hrp: 'cosmos',
        lcdInfo: alan.LCDInfo(host: networkInfo.lcdUrl, port: int.parse(networkInfo.lcdPort)),
        grpcInfo: alan.GRPCInfo(host: networkInfo.grpcUrl, port: int.parse(networkInfo.grpcPort)),
      );
      final wallet = alan.Wallet.derive(mnemonic.split(" "), alanNetworkInfo);
      return right(AlanPrivateWalletCredentials(
        publicInfo: WalletPublicInfo(
          chainId: 'cosmos',
          walletId: const Uuid().v4(),
          name: walletAlias,
          publicAddress: wallet.bech32Address,
        ),
        mnemonic: mnemonic,
        networkInfo: alanNetworkInfo,
      ));
    } catch (ex) {
      return left(InvalidMnemonicFailure(ex.toString()));
    }
  }
}
