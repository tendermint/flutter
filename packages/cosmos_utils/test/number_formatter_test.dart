import 'package:cosmos_utils/amount_formatter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Amount formatter test case', () {
    expect(formatAmount(37570000000), r'$37.6B');
    expect(formatAmount(10270, locale: 'pl', symbol: 'PLN'), '10,3 tys. PLN');
    expect(formatAmount(1027.004921), r'$1,027.00');
    expect(formatAmount(10000), r'$10K');
    expect(formatAmount(9999), r'$9,999.00');
    expect(formatAmount(1027), r'$1,027.00');
  });
}
