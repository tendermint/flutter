import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_signing_gateway/mobile/mobile_key_info_storage.dart';

import 'mocks/private_wallet_credentials_mock.dart';
import 'mocks/test_memory_storage.dart';

void main() {
  group("MobileKeyInfoStorage", () {
    const chainId = "atom";
    const walletId = "123walletId";
    const password = "coolPassword123";
    const mnemonic =
        "fruit talent run shallow police ripple wheat original cabbage vendor tilt income gasp meat acid annual armed system target great oxygen artist net elegant";

    const privateCredsStub = PrivateWalletCredentialsMock(
      chainId: chainId,
      walletId: walletId,
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

      final readResult = await storage.getPrivateCredentials(chainId: chainId, walletId: walletId, password: password);
      expect(readResult.isRight(), true, reason: "$readResult");
      expect(readResult.getOrElse(() => throw AssertionError()), privateCredsStub);
    });
    //
  });
}
