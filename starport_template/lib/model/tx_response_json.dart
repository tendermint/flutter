import 'package:starport_template/model/tx_json.dart';

class TxResponse {
  TxResponse({
    required this.txhash,
    required this.tx,
    required this.timestamp,
  });

  String txhash;
  Tx tx;
  DateTime timestamp;

  factory TxResponse.fromJson(Map<String, dynamic> json) => TxResponse(
        txhash: json["txhash"] as String? ?? '',
        tx: Tx.fromJson(json["tx"] as Map<String, dynamic>),
        timestamp: DateTime.parse(json["timestamp"] as String),
      );
}
