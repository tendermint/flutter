import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/model/balance_json.dart';
import 'package:starport_template/utils/base_env.dart';

class CosmosBalances {
  CosmosBalances(this.baseEnv);

  BaseEnv baseEnv;

  Future<List<Balance>> getBalances(String walletAddress) async {
    final uri = '${baseEnv.baseApiUrl}/cosmos/bank/v1beta1/balances/$walletAddress';
    final response = await http.get(Uri.parse(uri));
    final map = jsonDecode(response.body) as Map<String, dynamic>;
    if (map['balances'] == null) {
      return [];
    }
    final list = map['balances'] as List<dynamic>;

    return list
        .map((e) => BalanceJson.fromJson(e as Map<String, dynamic>))
        .map(
          (e) => Balance(
            denom: Denom(e.denom),
            amount: Amount.fromString(e.amount),
          ),
        )
        .toList();
  }
}
