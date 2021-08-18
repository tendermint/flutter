import 'package:alan/wallet/network_info.dart';
import 'package:transaction_signing_gateway/model/wallet_derivation_info.dart';

class AlanWalletDerivationInfo implements WalletDerivationInfo {
  final String mnemonic;
  final String walletAlias;
  final NetworkInfo networkInfo;

  AlanWalletDerivationInfo({
    required this.walletAlias,
    required this.networkInfo,
    required this.mnemonic,
  });
}
