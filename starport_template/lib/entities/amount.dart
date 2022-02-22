import 'package:decimal/decimal.dart';

class Amount {
  const Amount(this.value);

  Amount.fromString(String string) : value = Decimal.parse(string);
  Amount.fromDouble(double val) : value = Decimal.parse('$val');

  Amount.fromInt(int int) : value = Decimal.fromInt(int);

  final Decimal value;

  @override
  String toString() => value.toStringAsPrecision(10);

  String get displayText => value.toStringAsPrecision(10);
}

extension StringAmount on String {
  Amount get amount => Amount.fromString(this);
}

extension NumAmount on num {
  Amount get amount => Amount.fromInt(toInt());
}
