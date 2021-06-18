import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  test(
    'Ethereum test',
    () async {
      var rng = new Random.secure();
      String privateKey = Web3.privateKeyFromMnemonic(
          'anger horse tourist lab duck category second direct human ocean chalk tomorrow', childIndex: 1);
      var privateEthCredentials = EthPrivateKey.fromHex(privateKey);
      Wallet wallet = Wallet.createNew(privateEthCredentials, 'Hello', rng);

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
              '0xbd8e84c44d916d9ed5eae3c47402ce09f870be93'),
          gasPrice: EtherAmount.inWei(BigInt.one),
          maxGas: 100000,
          value: EtherAmount.fromUnitAndValue(EtherUnit.ether, 5),
        ),
      );
    },
//    skip: true,
  );
}
