import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test(
    'Etherium test',
    () async {
      var rng = new Random.secure();
      String privateKey = Web3.privateKeyFromMnemonic(
          'amount zebra lecture crew select clay define faculty globe story bitter canvas');
      var privateEthCredentials = EthPrivateKey.fromHex(privateKey);
      Wallet wallet = Wallet.createNew(privateEthCredentials, 'Hello', rng);
      print(wallet.toJson());

      var apiUrl = "HTTP://127.0.0.1:7545"; //Replace with your API

      var httpClient = new Client();
      var ethClient = new Web3Client(apiUrl, httpClient);

      EtherAmount balance = await ethClient.getBalance(
        EthereumAddress.fromHex(wallet.privateKey.address.hex),
      );
      print(balance.getValueInUnit(EtherUnit.ether));
      await ethClient.sendTransaction(
        privateEthCredentials,
        Transaction(
          to: EthereumAddress.fromHex(
              '0xF71902AB854d2C6cecce644EcAE9810662121ca2'),
          gasPrice: EtherAmount.inWei(BigInt.one),
          maxGas: 100000,
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 1),
        ),
      );
    },
    skip: true,
  );
}
