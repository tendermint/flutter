import 'package:alan/alan.dart' as alan;
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/alan/alan_credentials_serializer.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class AlanPrivateWalletCredentials extends Equatable implements PrivateWalletCredentials {
  const AlanPrivateWalletCredentials({
    required this.mnemonic,
    required this.publicInfo,
  });

  @override
  final String mnemonic;

  @override
  final WalletPublicInfo publicInfo;

  alan.Wallet alanWallet(alan.NetworkInfo networkInfo) => alan.Wallet.derive(
        mnemonic.split(' '),
        networkInfo,
      );

  @override
  String get serializerIdentifier => AlanCredentialsSerializer.id;

  @override
  List<Object?> get props => [
        publicInfo,
        mnemonic,
      ];

  AlanPrivateWalletCredentials copyWith({
    String? mnemonic,
    WalletPublicInfo? publicInfo,
  }) {
    return AlanPrivateWalletCredentials(
      mnemonic: mnemonic ?? this.mnemonic,
      publicInfo: publicInfo ?? this.publicInfo,
    );
  }
}
