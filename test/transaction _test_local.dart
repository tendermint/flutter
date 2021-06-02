import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WalletApi api = WalletApi();

  // Local hosted URLs
  var grpcUrl = 'localhost';
  var grcpPort = 9090;
  var lcdUrl = 'localhost';

  baseEnv.setEnv(grpcUrl, lcdUrl, grcpPort);

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'brush bleak category link own under around element update either jungle trap base swamp fitness hour section skill soon bread cousin text evil jazz',
        walletAlias: 'Alice');
  });

  test('Get first wallet balances', () async {
    var address = globalCache.wallets.first.walletAddress;
    var balances =
        await api.getWalletBalances(address);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      toAddress: 'cosmos12mav3ua40cnrfmeg08tucn3py6nvj4qkmn5nsu',
      fromAddress: globalCache.wallets.first.walletAddress,
      amount: '10',
      denom: 'token',
    );
  });

  test('Get wallet balances', () async {
    await Future.delayed(Duration(seconds: 2));
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });
}
