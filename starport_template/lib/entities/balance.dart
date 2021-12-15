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

  @override
  List<Object> get props => [
        denom,
        amount,
      ];
}
