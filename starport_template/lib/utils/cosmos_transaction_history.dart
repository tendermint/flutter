import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/entities/transaction.dart';
import 'package:starport_template/model/tx_response_json.dart';
import 'package:starport_template/utils/base_env.dart';

class CosmosTransactionHistory {
  BaseEnv baseEnv;

  CosmosTransactionHistory(this.baseEnv);

  Future<List<Transaction>> getTransactionHistory(String walletAddress) async {
    final outGoingTransactions = await getTransactionResponses(walletAddress, TransactionType.Send);
    final incomingTransactions = await getTransactionResponses(walletAddress, TransactionType.Receive);

    final list = [...outGoingTransactions, ...incomingTransactions];
    list.sort((a, b) => b.date.compareTo(a.date));

    return list;
  }

  Future<List<Transaction>> getTransactionResponses(String walletAddress, TransactionType type) async {
    final uri =
        '${baseEnv.baseApiUrl}/cosmos/tx/v1beta1/txs?events=transfer.${type == TransactionType.Send ? 'sender' : 'recipient'}%3D%27$walletAddress%27';
    final response = await http.get(Uri.parse(uri));
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    if (map['tx_responses'] == null) {
      return [];
    }
    final list = map['tx_responses'] as List<dynamic>;

    return list
        .map((e) => TxResponse.fromJson(e as Map<String, dynamic>))
        .map(
          (e) => Transaction(
            denom: Denom(e.tx.body.messages.first.amount.first.denom),
            amount: Amount.fromString(e.tx.body.messages.first.amount.first.amount),
            date: e.timestamp,
            type: type,
          ),
        )
        .toList();
  }
}
