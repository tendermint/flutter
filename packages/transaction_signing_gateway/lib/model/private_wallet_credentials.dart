import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

abstract class PrivateWalletCredentials {
  WalletPublicInfo get publicInfo;

  String get mnemonic;

  /// needed to find a proper serializer that will deal with serializing/deserializing of theese credentials
  String get serializerIdentifier;
}
