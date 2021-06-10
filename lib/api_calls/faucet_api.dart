import 'dart:convert';

import '../global.dart';

class FaucetApi {
  getFreeTokens(String address) async {
    final Uri uri = Uri.parse('https://faucet.testnet.cosmos.network/');
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