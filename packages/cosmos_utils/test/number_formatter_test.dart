import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Amount formatter test case', () {
    expect(formatAmount(37570000000), '\$37B');
  });
}
