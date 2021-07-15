import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class PrivateWalletCredentialsMock extends Equatable implements PrivateWalletCredentials {
  @override
  final String mnemonic;

  @override
  final WalletPublicInfo publicInfo;

  @override
  String get serializerIdentifier => TestPrivateCredentialsSerializer.sIdentifier;

  const PrivateWalletCredentialsMock({
    required this.mnemonic,
    required this.publicInfo,
  });

  @override
  List<Object?> get props => [
        mnemonic,
        publicInfo,
        serializerIdentifier,
      ];
}

class TestPrivateCredentialsSerializer implements PrivateWalletCredentialsSerializer {
  static const String sIdentifier = "TestPrivateCredentialsSerializer";

  @override
  Either<CredentialsStorageFailure, PrivateWalletCredentials> fromJson(
    Map<String, dynamic> json,
  ) {
    try {
      return right(PrivateWalletCredentialsMock(
        publicInfo: WalletPublicInfo(
          chainId: json['chainId'] as String,
          walletId: json['walletId'] as String,
          name: json['name'] as String,
          publicAddress: json['publicAddress'] as String,
        ),
        mnemonic: json['mnemonic'] as String,
      ));
    } catch (e) {
      return left(CredentialsStorageFailure("could not parse json:\n$json"));
    }
  }

  @override
  String get identifier => sIdentifier;

  @override
  Either<CredentialsStorageFailure, Map<String, dynamic>> toJson(
    PrivateWalletCredentials credentials,
  ) =>
      right({
        'chainId': credentials.publicInfo.chainId,
        'walletId': credentials.publicInfo.walletId,
        'mnemonic': credentials.mnemonic,
        'name': credentials.publicInfo.name,
        'publicAddress': credentials.publicInfo.publicAddress
      });
}
