import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test(
    'Ethereum test',
    () async {
      final rng = Random.secure();
      final privateKey =
          Web3.privateKeyFromMnemonic('amount zebra lecture crew select clay define faculty globe story bitter canvas');
      final privateEthCredentials = EthPrivateKey.fromHex(privateKey);
      final wallet = Wallet.createNew(privateEthCredentials, 'Hello', rng);
      debugPrint(wallet.toJson());

      const apiUrl = "HTTP://127.0.0.1:7545"; //Replace with your API

      final httpClient = Client();
      final ethClient = Web3Client(apiUrl, httpClient);

      final balance = await ethClient.getBalance(
        EthereumAddress.fromHex(wallet.privateKey.address.hex),
      );
      debugPrint("${balance.getValueInUnit(EtherUnit.ether)}");
      await ethClient.sendTransaction(
        privateEthCredentials,
        Transaction(
          to: EthereumAddress.fromHex('0xF71902AB854d2C6cecce644EcAE9810662121ca2'),
          gasPrice: EtherAmount.inWei(BigInt.one),
          maxGas: 100000,
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
        ),
      );
    },
    skip: true,
  );
}
