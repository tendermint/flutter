
import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WalletApi api = WalletApi();
  // Public hosted URLs
  var grpcUrl = 'grpc.testnet.cosmos.network';
  var grcpPort = 443;
  var lcdUrl = 'api.testnet.cosmos.network';


  // Local hosted URLs
//  var grpcUrl = 'localhost';
//  var grcpPort = 9090;
//  var lcdUrl = 'localhost';


  baseEnv.setEnv(grpcUrl, lcdUrl, grcpPort);

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'beauty coffee goddess debate nose aunt safe genuine head fury mixture ankle also kind else recycle liar that reveal peace weird badge cart grit',
        walletAlias: 'Alice');
  });

  test('Get wallet balances', () async {
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    print(balances.balances[1].amount);
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      toAddress: 'cosmos1qzz3sxlsxk4e2w4lpaj7pymg7le2gzcxrrf256',
      fromAddress: globalCache.wallets.first.walletAddress,
      amount: '10',
      denom: 'token',
    );
  });

  test('Get wallet balances', () async {
    await Future.delayed(Duration(seconds: 2));
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    print(balances.balances[1].amount);
  });
}
