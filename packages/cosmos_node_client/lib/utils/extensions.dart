import 'dart:typed_data';

/// Extension methods on the [Uint8List] class.
extension Uin8ListExt on Uint8List {
  /// Encodes this [Uint8List] to a [BigInt] using the big-endian conversion.
  BigInt toBigInt() {
    final bytes = this;
    var result = BigInt.from(0);
    for (var i = 0; i < bytes.length; i++) {
      result += BigInt.from(bytes[bytes.length - i - 1]) << (8 * i);
    }
    return result;
  }
}

extension BigIntExtension on BigInt {
  /// Converts this [BigInt] into a [Uint8List] encoding it with
  /// the big-endian encoding.
  Uint8List toUin8List() {
    // Not handling negative numbers. Decide how you want to do that.
    final _byteMask = BigInt.from(0xff);
    var number = this;
    final size = (number.bitLength + 7) >> 3;
    final result = Uint8List(size);

    for (var i = 0; i < size; i++) {
      result[size - i - 1] = (number & _byteMask).toInt();
      number = number >> 8;
    }
    return result;
  }
}
