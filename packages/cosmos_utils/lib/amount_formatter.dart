import 'package:intl/intl.dart';

String formatAmount(double amount) {
  final formatted = NumberFormat.currency(symbol: '\$').format(amount);
  final raw = formatted.split('.')[0].substring(1).replaceAll(',', '');
  if (raw.length >= 7) {
    if (raw.length >= 16) {
      return _getShortAmount(raw, 15, 'Q'); // Quadrillion
    }
    if (raw.length >= 13) {
      return _getShortAmount(raw, 12, 'T'); // Trillion
    }
    if (raw.length >= 10) {
      return _getShortAmount(raw, 9, 'B'); // Billion
    }
    return _getShortAmount(raw, 6, 'M'); // Million
  }
  return formatted;
}

String _getShortAmount(String raw, int numberOfZeros, String annotation) =>
    '\$${raw.replaceRange(raw.length - numberOfZeros, raw.length, annotation)}';
