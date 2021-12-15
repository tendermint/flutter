import 'package:starport_template/model/tx_json.dart';

class TxResponseJson {
  TxResponseJson({
    required this.txhash,
    required this.tx,
    required this.timestamp,
  });

  factory TxResponseJson.fromJson(Map<String, dynamic> json) => TxResponseJson(
        txhash: json['txhash'] as String? ?? '',
        tx: TxJson.fromJson(json['tx'] as Map<String, dynamic>),
        timestamp: DateTime.parse(json['timestamp'] as String),
      );

  String txhash;
  TxJson tx;
  DateTime timestamp;
}
