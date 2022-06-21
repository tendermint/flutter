import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('bech32 to hex conversion', () {
    const address = 'cosmos1ygptsc84j7lezp6cvrjffu52520tla508qp4vk';
    const expected = '2202b860f597bf91075860e494f28aa29ebff68f';

    // ignore: deprecated_member_use_from_same_package
    expect(bech32ToHex(address), expected);
  });
}
