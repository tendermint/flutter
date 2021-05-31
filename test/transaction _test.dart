
import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  WalletApi api = WalletApi();

  test('Import wallet', () {
    api.importWallet(
        mnemonicString:
            'busy drama analyst wool finger elevator silent once wedding monkey have fashion used media sleep scrub claim erupt dream inquiry traffic pipe inhale genius',
        walletAlias: 'Waleed');
  });

  test('Get wallet balances', () async {
    var balances =
        await api.getWalletBalances(globalCache.wallets.first.walletAddress);
    print(balances.balances[1].amount);
  });

  test('Make a transaction from Alice to Bob', () async {
    await api.sendAmount(
      toAddress: 'cosmos1ew6qw3h0482an8fdf4wfx767q8nrgsx3r2y02f',
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
