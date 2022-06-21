import 'package:bech32/bech32.dart';

List<int> convertBits(
  List<int> data, {
  required int from,
  required int to,
  bool pad = true,
}) {
  var acc = 0;
  var bits = 0;
  final result = <int>[];
  final maxV = (1 << to) - 1;

  for (final v in data) {
    if (v < 0 || (v >> from) != 0) {
      throw Exception();
    }
    acc = (acc << from) | v;
    bits += from;
    while (bits >= to) {
      bits -= to;
      result.add((acc >> bits) & maxV);
    }
  }

  if (pad) {
    if (bits > 0) {
      result.add((acc << (to - bits)) & maxV);
    }
  } else if (bits >= from) {
    throw InvalidPadding('illegal zero padding');
  } else if (((acc << (to - bits)) & maxV) != 0) {
    throw InvalidPadding('non zero');
  }

  return result;
}
