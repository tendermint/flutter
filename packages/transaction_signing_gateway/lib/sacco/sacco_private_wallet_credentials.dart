import 'package:equatable/equatable.dart';
import 'package:sacco/sacco.dart' as sacco;
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/sacco/sacco_credentials_serializer.dart';

class SaccoPrivateWalletCredentials extends Equatable implements PrivateWalletCredentials {
  @override
  final String mnemonic;

  @override
  final WalletPublicInfo publicInfo;

  final sacco.NetworkInfo networkInfo;

  const SaccoPrivateWalletCredentials({
    required this.mnemonic,
    required this.publicInfo,
    required this.networkInfo,
  });

  sacco.Wallet get saccoWallet => sacco.Wallet.derive(
        mnemonic.split(" "),
        networkInfo,
      );

  @override
  String get serializerIdentifier => SaccoCredentialsSerializer.id;

  @override
  List<Object?> get props => [
        publicInfo,
        mnemonic,
        networkInfo.bech32Hrp,
        networkInfo.lcdUrl,
        networkInfo.name,
        networkInfo.iconUrl,
        networkInfo.defaultTokenDenom,
      ];
}
