import 'dart:convert';

import 'package:flutter_app/global.dart';

class FaucetApi {
  Future<void> getFreeTokens(String address) async {
    final uri = Uri.parse('https://faucet.testnet.cosmos.network/');
    await client.post(
      uri,
      body: jsonEncode(
        {
          "address": address,
          "coins": ["100uphoton"]
        },
      ),
    );
  }
}
