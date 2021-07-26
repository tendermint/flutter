import 'package:flutter_test/flutter_test.dart';
import 'package:alan/alan.dart' as alan;
import 'package:transaction_signing_gateway/alan/alan_credentials_serializer.dart';
import 'package:transaction_signing_gateway/alan/alan_private_wallet_credentials.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

void main() {
  group("Alan Serializer tests", () {
    final serializer = AlanCredentialsSerializer();
    final credentials = AlanPrivateWalletCredentials(
      mnemonic: "mnemonic",
      networkInfo: alan.NetworkInfo.fromSingleHost(
        bech32Hrp: "cosmos",
        host: 'localhost',
      ),
      publicInfo: const WalletPublicInfo(
        chainId: "chainId",
        walletId: "walletId",
        name: 'name',
        publicAddress: 'cosmos1ec4v57s7weuwatd36dgpjh8hj4gnj2cuut9sav',
      ),
    );

    test("serializes and deserializes correctly", () {
      final jsonResult = serializer.toJson(credentials);
      expect(jsonResult.isRight(), true);
      final credentialsResult = jsonResult.flatMap((json) => serializer.fromJson(json));
      expect(credentialsResult.isRight(), true);
      expect(credentialsResult.getOrElse(() => throw ""), credentials);
    });
  });
}
