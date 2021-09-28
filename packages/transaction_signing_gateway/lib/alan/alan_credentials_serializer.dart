import 'package:alan/alan.dart' as alan;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials_serializer.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class AlanCredentialsSerializer implements PrivateWalletCredentialsSerializer {
  static const id = "AlanCredentialsSerializer";

  static const _chainIdKey = "chain_id";
  static const _mnemonicKey = "mnemonic";
  static const _networkInfoKey = "networkInfo";
  static const _walletIdKey = "walletId";

  static const _bech32HrpKey = "bech32Hrp";
  static const _nameKey = "name";
  static const _publicAddressKey = "publicAddress";
  static const _host = "host";

  @override
  Either<CredentialsStorageFailure, PrivateWalletCredentials> fromJson(Map<String, dynamic> json) {
    try {
      final networkInfo = json[_networkInfoKey];
      return right(
        AlanPrivateWalletCredentials(
          mnemonic: json[_mnemonicKey] as String? ?? "",
          networkInfo: alan.NetworkInfo.fromSingleHost(
            bech32Hrp: networkInfo[_bech32HrpKey] as String? ?? "",
            host: networkInfo[_host] as String? ?? "",
          ),
          publicInfo: WalletPublicInfo(
            name: json[_nameKey] as String? ?? "",
            publicAddress: json[_publicAddressKey] as String? ?? "",
            walletId: json[_walletIdKey] as String? ?? "",
            chainId: json[_chainIdKey] as String? ?? "",
          ),
        ),
      );
    } catch (e, stack) {
      debugPrint("$e\n$stack");
      return left(CredentialsStorageFailure("Could not parse wallet credentials: $e"));
    }
  }

  @override
  String get identifier => id;

  @override
  Either<CredentialsStorageFailure, Map<String, dynamic>> toJson(PrivateWalletCredentials credentials) {
    if (credentials is! AlanPrivateWalletCredentials) {
      return left(
        CredentialsStorageFailure(
          "Passed credentials are not of type $AlanPrivateWalletCredentials. actual: $credentials",
        ),
      );
    }
    return right({
      _chainIdKey: credentials.publicInfo.chainId,
      _walletIdKey: credentials.publicInfo.walletId,
      _publicAddressKey: credentials.publicInfo.publicAddress,
      _nameKey: credentials.publicInfo.name,
      _mnemonicKey: credentials.mnemonic,
      _networkInfoKey: {
        _bech32HrpKey: credentials.networkInfo.bech32Hrp,
        _host: credentials.networkInfo.lcdInfo.host,
      },
    });
  }
}
