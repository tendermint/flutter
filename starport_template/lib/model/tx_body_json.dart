import 'package:starport_template/model/tx_body_message_json.dart';

class TxBodyJson {
  TxBodyJson({required this.messages});

  List<TxBodyMessageJson> messages;

  factory TxBodyJson.fromJson(Map<String, dynamic> json) => TxBodyJson(
        messages: (json["messages"] as List).map((x) => TxBodyMessageJson.fromJson(x as Map<String, dynamic>)).toList(),
      );
}
