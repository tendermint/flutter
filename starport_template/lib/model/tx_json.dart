import 'package:starport_template/model/tx_body_json.dart';

class TxJson {
  TxJson({
    required this.type,
    required this.body,
  });

  factory TxJson.fromJson(Map<String, dynamic> json) => TxJson(
        type: json['@type'] as String? ?? '',
        body: TxBodyJson.fromJson(json['body'] as Map<String, dynamic>),
      );

  String type;
  TxBodyJson body;
}
