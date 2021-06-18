import 'package:flutter_app/api_calls/cosmos_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CosmosApi api = CosmosApi();

  var port = const String.fromEnvironment('PORT', defaultValue: '1317');
  var lcdUrl =
      const String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  var ethUrl =
      const String.fromEnvironment('BASE_ETH_URL', defaultValue: 'localhost');

  baseEnv.setEnv(lcdUrl, port, ethUrl);

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'system cube slight program float all alert kite current home balcony sight arena web parent manage noodle boost asthma sudden canoe gain around inflict',
        walletAlias: 'Alice');
  });

  test('Import Bob wallet', () {
    api.importWallet(
        mnemonicString:
            'matter tree shrimp orange rich can motion air devote salmon stomach practice kid frog pelican topple wrist cancel sense abuse write nuclear faculty camp',
        walletAlias: 'Bob');
  });

  test('Get Alice wallet balances', () async {
    var address = globalCache.wallets[0].walletAddress;
    var balances = await api.getWalletBalances(address);
    print(globalCache.wallets[0].walletAlias);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Get Bob wallet balances', () async {
    var address = globalCache.wallets[1].walletAddress;
    var balances = await api.getWalletBalances(address);
    print(globalCache.wallets[1].walletAlias);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      fromAddress: globalCache.wallets[0].walletAddress,
      toAddress: globalCache.wallets[1].walletAddress,
      amount: '10',
      denom: 'token',
    );
  });

  test('Get Alice wallet balances', () async {
    var address = globalCache.wallets[0].walletAddress;
    var balances = await api.getWalletBalances(address);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Get Bob wallet balances', () async {
    var address = globalCache.wallets[1].walletAddress;
    var balances = await api.getWalletBalances(address);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });
}
