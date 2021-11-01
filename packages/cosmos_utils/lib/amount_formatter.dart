import 'package:intl/intl.dart';

String formatAmount(double amount) => NumberFormat.compactCurrency(symbol: '\$').format(amount);
