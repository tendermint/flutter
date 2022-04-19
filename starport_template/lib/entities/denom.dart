import 'package:cosmos_utils/amount_formatter.dart';
import 'package:equatable/equatable.dart';
import 'package:starport_template/entities/amount.dart';

class Denom extends Equatable {
  const Denom(
    this.text,
  );

  final String text;

  String amountWithDenomText(Amount amount) => '${formatAmount(amount.value.toDouble(), symbol: '')} $text';

  @override
  List<Object> get props => [
        text,
      ];

  @override
  String toString() => text;
}
