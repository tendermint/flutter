import 'package:flutter_test/flutter_test.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info_serializer.dart';

void main() {
  late WalletPublicInfo publicInfo;

  setUp(() {
    publicInfo = const WalletPublicInfo(
      name: "a name",
      publicAddress: "cosmos1wze8mn5nsgl9qrgazc6f92fve7m5e6psjcx2du",
      walletId: "fc74d409-3945-4f53-ba76-a03b3cee7865",
      chainId: "cosmoshub",
      additionalData: "additional data",
    );
  });

  test("serializes wallet info", () async {
    final map = WalletPublicInfoSerializer.toMap(publicInfo);
    final info = WalletPublicInfoSerializer.fromMap(map);
    expect(map["name"], publicInfo.name);
    expect(map["chain_id"], publicInfo.chainId);
    expect(map["public_address"], publicInfo.publicAddress);
    expect(map["wallet_Id"], publicInfo.walletId);
    expect(map["additional_data"], publicInfo.additionalData);
    expect(info, publicInfo);
  });

  test("serializes wallet info", () async {
    final infoWithoutAdditionalData = WalletPublicInfo(
      name: publicInfo.name,
      publicAddress: publicInfo.publicAddress,
      walletId: publicInfo.walletId,
      chainId: publicInfo.chainId,
    );
    final map = WalletPublicInfoSerializer.toMap(infoWithoutAdditionalData);
    final info = WalletPublicInfoSerializer.fromMap(map);
    expect(map["additional_data"], null);
    expect(info.additionalData, null);
  });
}
