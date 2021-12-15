import 'package:starport_template/model/amount_json.dart';

class TxBodyMessageJson {
  TxBodyMessageJson({
    required this.type,
    required this.fromAddress,
    required this.toAddress,
    required this.amount,
  });

  factory TxBodyMessageJson.fromJson(Map<String, dynamic> json) => TxBodyMessageJson(
        type: json['@type'] as String? ?? '',
        fromAddress: json['from_address'] as String? ?? '',
        toAddress: json['to_address'] as String? ?? '',
        amount: (json['amount'] as List).map((x) => AmountJson.fromJson(x as Map<String, dynamic>)).toList(),
      );

  String type;
  String fromAddress;
  String toAddress;
  List<AmountJson> amount;
}
