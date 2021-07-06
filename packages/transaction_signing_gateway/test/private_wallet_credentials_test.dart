import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_signing_gateway/model/private_wallet_credentials.dart';

void main() {
  test("from empty Json", () async {
    final creds = PrivateWalletCredentials.fromJson({});
    expect(creds?.walletId, "");
    expect(creds?.mnemonic, "");
    expect(creds?.chainId, "");
  });

  test("null from null Json", () async {
    final creds = PrivateWalletCredentials.fromJson(null);
    expect(creds, isNull);
  });

  test("fromJson and toJson interoperability", () async {
    const creds = PrivateWalletCredentials(
      mnemonic: "some random mnemonic",
      chainId: "chain id",
      walletId: "wallet id",
    );
    expect(PrivateWalletCredentials.fromJson(creds.toJson()), equals(creds));
  });
}
