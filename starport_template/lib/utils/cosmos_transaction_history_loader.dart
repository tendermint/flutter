import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starport_template/app_config.dart';
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/entities/transaction_history_item.dart';
import 'package:starport_template/model/tx_response_json.dart';

class CosmosTransactionHistoryLoader {
  CosmosTransactionHistoryLoader(this.appConfig);

  AppConfig appConfig;

  Future<List<TransactionHistoryItem>> getTransactionHistory(String accountAddress) async {
    final outGoingTransactions = await _getTransactionResponses(accountAddress, TransactionType.Send);
    final incomingTransactions = await _getTransactionResponses(accountAddress, TransactionType.Receive);

    final list = [...outGoingTransactions, ...incomingTransactions] //
      ..sort((a, b) => b.date.compareTo(a.date));

    return list;
  }

  Future<List<TransactionHistoryItem>> _getTransactionResponses(String accountAddress, TransactionType type) async {
    final uri =
        '${appConfig.baseApiUrl}/cosmos/tx/v1beta1/txs?events=transfer.${type == TransactionType.Send ? 'sender' : 'recipient'}%3D%27$accountAddress%27';
    final response = await http.get(Uri.parse(uri));
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    if (map['tx_responses'] == null) {
      return [];
    }
    final list = map['tx_responses'] as List<dynamic>;

    return list
        .map((e) => TxResponseJson.fromJson(e as Map<String, dynamic>))
        .map(
          (e) => TransactionHistoryItem(
            denom: Denom(e.tx.body.messages.first.amount.first.denom),
            amount: Amount.fromString(e.tx.body.messages.first.amount.first.amount),
            date: e.timestamp,
            type: type,
          ),
        )
        .toList();
  }
}
