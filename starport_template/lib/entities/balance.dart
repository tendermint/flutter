import 'package:equatable/equatable.dart';
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/denom.dart';

class Balance extends Equatable {
  const Balance({
    required this.denom,
    required this.amount,
  });

  final Denom denom;
  final Amount amount;

  @override
  String toString() => '$amount $denom';

  String get amountWithDenomText => denom.amountWithDenomText(amount);

  @override
  List<Object> get props => [
        denom,
        amount,
      ];

  Balance copyWith({
    Denom? denom,
    Amount? amount,
  }) {
    return Balance(
      denom: denom ?? this.denom,
      amount: amount ?? this.amount,
    );
  }
}
