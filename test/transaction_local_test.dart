import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/api_calls/cosmos_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final api = CosmosApi();

  const port = String.fromEnvironment('PORT', defaultValue: '1317');
  const lcdUrl = String.fromEnvironment('BASE_LCD_URL', defaultValue: 'localhost');

  const ethUrl = String.fromEnvironment('BASE_ETH_URL', defaultValue: 'localhost');

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

  test(
    'Get Alice wallet balances',
    () async {
      final address = globalCache.wallets[0].walletDetails.walletAddress;
      final balances = await api.getWalletBalances(address);
      debugPrint(globalCache.wallets[0].walletDetails.walletAlias);

      for (final element in balances.balances) {
        debugPrint('${element.denom} ${element.amount}');
      }
    },
    skip: true,
  );

  test(
    'Get Bob wallet balances',
    () async {
      final address = globalCache.wallets[1].walletDetails.walletAddress;
      final balances = await api.getWalletBalances(address);
      debugPrint(globalCache.wallets[1].walletDetails.walletAlias);

      for (final element in balances.balances) {
        debugPrint('${element.denom} ${element.amount}');
      }
    },
    skip: true,
  );

  test(
    'Make a transaction from Alice to Bob',
    () async {
      await api.sendAmount(
        fromAddress: globalCache.wallets[0].walletDetails.walletAddress,
        toAddress: globalCache.wallets[1].walletDetails.walletAddress,
        amount: '10',
        denom: 'token',
      );
    },
    skip: true,
  );

  test(
    'Get Alice wallet balances',
    () async {
      final address = globalCache.wallets[0].walletDetails.walletAddress;
      final balances = await api.getWalletBalances(address);

      for (final element in balances.balances) {
        debugPrint('${element.denom} ${element.amount}');
      }
    },
    skip: true,
  );

  test(
    'Get Bob wallet balances',
    () async {
      final address = globalCache.wallets[1].walletDetails.walletAddress;
      final balances = await api.getWalletBalances(address);

      for (final element in balances.balances) {
        debugPrint('${element.denom} ${element.amount}');
      }
    },
    skip: true,
  );
}
