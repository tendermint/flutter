import 'package:starport_template/model/tx_body_json.dart';

class TxJson {
  TxJson({
    required this.type,
    required this.body,
  });

  String type;
  TxBodyJson body;

  factory TxJson.fromJson(Map<String, dynamic> json) => TxJson(
        type: json["@type"] as String? ?? '',
        body: TxBodyJson.fromJson(json["body"] as Map<String, dynamic>),
      );
}
