import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_signing_gateway/mobile/mobile_key_info_storage.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

import 'mocks/private_wallet_credentials_mock.dart';
import 'mocks/test_memory_storage.dart';

void main() {
  group("MobileKeyInfoStorage", () {
    const chainId = "atom";
    const walletId = "123walletId";
    const password = "coolPassword123";
    const name = "name";
    const publicAddress = "cosmos1wze8mn5nsgl9qrgazq6a92fvh7m5e6psjcx2du";
    const publicAddress2 = "cosmos124maqmcqv8tquy764ktz7cu0gxnzfw54k9cmz5";
    const mnemonic =
        "fruit talent run shallow police ripple wheat original cabbage vendor tilt income gasp meat acid annual armed system target great oxygen artist net elegant";

    const privateCredsStub = PrivateWalletCredentialsMock(
      publicInfo: WalletPublicInfo(
        name: name,
        publicAddress: publicAddress,
        walletId: walletId,
        chainId: chainId,
      ),
      mnemonic: mnemonic,
    );
    const privateCredsStub2 = PrivateWalletCredentialsMock(
      publicInfo: WalletPublicInfo(
        name: "$name 2",
        publicAddress: publicAddress2,
        walletId: "${walletId}2",
        chainId: "${chainId}2",
      ),
      mnemonic: mnemonic,
    );
    final storage = MobileKeyInfoStorage(
      storage: TestMemoryStorage(),
      serializers: [TestPrivateCredentialsSerializer()],
    );
    //
    test("save and retrieve creds", () async {
      final saveResult = await storage.savePrivateCredentials(walletCredentials: privateCredsStub, password: password);
      expect(saveResult.isRight(), true, reason: "$saveResult");

      final readResult = await storage.getPrivateCredentials(
        const WalletLookupKey(
          chainId: chainId,
          walletId: walletId,
          password: password,
        ),
      );
      expect(readResult.isRight(), true, reason: "$readResult");
      expect(readResult.getOrElse(() => throw AssertionError()), privateCredsStub);
    });

    //
    test("retrieve public infos", () async {
      await storage.savePrivateCredentials(walletCredentials: privateCredsStub, password: password);
      await storage.savePrivateCredentials(walletCredentials: privateCredsStub2, password: password);

      final readResult = await storage.getWalletsList();
      expect(readResult.isRight(), true, reason: "$readResult");
      final list = readResult.getOrElse(() => throw AssertionError());
      expect(list[0], privateCredsStub.publicInfo);
      expect(list[1], privateCredsStub2.publicInfo);
    });
    //
  });
}
