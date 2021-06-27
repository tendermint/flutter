import 'package:flutter/foundation.dart';
import 'package:flutter_app/data/api_calls/cosmos_api.dart';
import 'package:flutter_app/data/api_calls/faucet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final api = CosmosApi();
  final faucetApi = FaucetApi();

  const port = '443';
  const lcdUrl = 'api.testnet.cosmos.network';

  const ethUrl = 'https://ropsten.infura.io/v3/96ac5dcb92d545b6a7ffc3d8af21fde0';

  baseEnv.setEnv(lcdUrl, port, ethUrl);

  test('Import Alice wallet', () {
    api.importWallet(
        mnemonicString:
            'brush bleak category link own under around element update either jungle trap base swamp fitness hour section skill soon bread cousin text evil jazz',
        walletAlias: 'Alice');
  });

  test('Import Bob wallet', () {
    api.importWallet(
        mnemonicString:
            'oak favorite woman uniform try initial grant craft sun copper aim arctic grape mansion floor apology false crash hold family veteran under wink loan',
        walletAlias: 'Bob');
  });

  test('Get first wallet balances', () async {
    final wallet = globalCache.wallets[0];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);
    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });

  test('Get second wallet balances', () async {
    final wallet = globalCache.wallets[1];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);

    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });

  test('Get free tokens for Alice', () async {
    final wallet = globalCache.wallets[0];
    final address = wallet.walletDetails.walletAddress;
    debugPrint('Getting free tokens for Alice');
    await faucetApi.getFreeTokens(address);
  });

  test('Get free tokens for Bob', () async {
    final wallet = globalCache.wallets[1];
    final address = wallet.walletDetails.walletAddress;
    debugPrint('Getting free tokens for Bob');
    await faucetApi.getFreeTokens(address);
  });

  test('Get first wallet balances', () async {
    final wallet = globalCache.wallets[0];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);

    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });

  test('Get second wallet balances', () async {
    final wallet = globalCache.wallets[1];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);

    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      fromAddress: globalCache.wallets[0].walletDetails.walletAddress,
      toAddress: globalCache.wallets[1].walletDetails.walletAddress,
      amount: '10',
      denom: 'uphoton',
    );
  });

  test('Get first wallet balances', () async {
    final wallet = globalCache.wallets[0];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);
    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });

  test('Get second wallet balances', () async {
    final wallet = globalCache.wallets[1];
    final address = wallet.walletDetails.walletAddress;
    final balances = await api.getWalletBalances(address);
    debugPrint(wallet.walletDetails.walletAlias);

    for (final element in balances.balances) {
      debugPrint('${element.denom} ${element.amount}');
    }
  });
}
