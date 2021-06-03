import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WalletApi api = WalletApi();

  // Local hosted URLs
  var grpcUrl = 'localhost';
  var port = 1317;
  var lcdUrl = 'localhost';

  baseEnv.setEnv(lcdUrl, port);

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'wonder find habit barely border neck half appear area split praise next when state wrist exhibit movie parade cheap govern end result industry fly',
        walletAlias: 'Alice');
  });

  test('Import Bob wallet', () {
    api.importWallet(
        mnemonicString:
        'old near pigeon pipe magnet razor fatal whale minor scale good certain wheel pretty fitness twist detail all noble virtual room fitness cherry drip',
        walletAlias: 'Bob');
  });

  test('Get Alice wallet balances', () async {
    var address = globalCache.wallets[0].walletAddress;
    var balances =
        await api.getWalletBalances(address);
    print(globalCache.wallets[0].walletAlias);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Get Bob wallet balances', () async {
    var address = globalCache.wallets[1].walletAddress;
    var balances =
    await api.getWalletBalances(address);
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
    var balances =
    await api.getWalletBalances(address);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });

  test('Get Bob wallet balances', () async {
    var address = globalCache.wallets[1].walletAddress;
    var balances =
    await api.getWalletBalances(address);
    balances.balances.forEach((element) {
      print(element.denom + ' ' + element.amount);
    });
  });
}
