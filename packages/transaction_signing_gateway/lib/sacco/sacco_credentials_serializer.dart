import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:sacco/sacco.dart' as sacco;
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/sacco/sacco_private_wallet_credentials.dart';

class SaccoCredentialsSerializer implements PrivateWalletCredentialsSerializer {
  static const id = "SaccoCredentialsSerializer";

  static const _chainIdKey = "chain_id";
  static const _mnemonicKey = "mnemonic";
  static const _networkInfoKey = "networkInfo";
  static const _walletIdKey = "walletId";

  static const _bech32HrpKey = "bech32Hrp";
  static const _lcdUrlKey = "lcdUrl";
  static const _nameKey = "name";
  static const _publicAddressKey = "publicAddress";
  static const _iconUrlKey = "iconUrl";
  static const _defaultTokenDenomKey = "defaultTokenDenom";

  @override
  Either<CredentialsStorageFailure, PrivateWalletCredentials> fromJson(Map<String, dynamic> json) {
    try {
      final networkInfo = json[_networkInfoKey];
      return right(SaccoPrivateWalletCredentials(
        mnemonic: json[_mnemonicKey] as String? ?? "",
        networkInfo: sacco.NetworkInfo(
          bech32Hrp: networkInfo[_bech32HrpKey] as String? ?? "",
          lcdUrl: Uri.parse(networkInfo[_lcdUrlKey] as String? ?? ""),
          name: networkInfo[_nameKey] as String? ?? "",
          iconUrl: networkInfo[_iconUrlKey] as String? ?? "",
          defaultTokenDenom: networkInfo[_defaultTokenDenomKey] as String? ?? "",
        ),
        publicInfo: WalletPublicInfo(
          name: json[_nameKey] as String? ?? "",
          publicAddress: json[_publicAddressKey] as String? ?? "",
          walletId: json[_walletIdKey] as String? ?? "",
          chainId: json[_chainIdKey] as String? ?? "",
        ),
      ));
    } catch (e, stack) {
      debugPrint("$e\n$stack");
      return left(CredentialsStorageFailure("Could not parse wallet credentials: $e"));
    }
  }

  @override
  String get identifier => id;

  @override
  Either<CredentialsStorageFailure, Map<String, dynamic>> toJson(PrivateWalletCredentials credentials) {
    if (credentials is! SaccoPrivateWalletCredentials) {
      return left(CredentialsStorageFailure(
          "Passed credentials are not of type $SaccoPrivateWalletCredentials. actual: $credentials"));
    }
    return right({
      _chainIdKey: credentials.publicInfo.chainId,
      _walletIdKey: credentials.publicInfo.walletId,
      _publicAddressKey: credentials.publicInfo.publicAddress,
      _nameKey: credentials.publicInfo.name,
      _mnemonicKey: credentials.mnemonic,
      _networkInfoKey: {
        _bech32HrpKey: credentials.networkInfo.bech32Hrp,
        _lcdUrlKey: credentials.networkInfo.lcdUrl.toString(),
        _nameKey: credentials.networkInfo.name,
        _iconUrlKey: credentials.networkInfo.iconUrl,
        _defaultTokenDenomKey: credentials.networkInfo.defaultTokenDenom,
      },
    });
  }
}
