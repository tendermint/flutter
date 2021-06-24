import 'dart:math';
import 'package:flutter_app/api_calls/base_wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/ethereum_wallet.dart';
import 'package:flutter_app/models/emeris_wallet.dart';
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart';

class EthereumApi extends BaseWalletApi {
  String? privateKey;

  @override
  Future<BalancesModel> getWalletBalances(String walletAddress) async {
    final apiUrl = baseEnv.baseEthUrl;

    final httpClient = Client();
    final ethClient = Web3Client(apiUrl, httpClient);

    final balance = await ethClient.getBalance(
      EthereumAddress.fromHex(walletAddress),
    );

    return BalancesModel(balances: [
      Balances(
        denom: 'Eth',
        amount: balance.getValueInUnit(EtherUnit.ether).toString(),
      ),
    ], pagination: Pagination(total: '1'));
  }

  @override
  void importWallet({required String mnemonicString, required String walletAlias}) {
    final rng = Random.secure();
    privateKey = Web3.privateKeyFromMnemonic(mnemonicString);
    final privateEthCredentials = EthPrivateKey.fromHex(privateKey!);
    final wallet = Wallet.createNew(privateEthCredentials, 'Hello', rng);
    globalCache.wallets.add(
      EthereumWallet(
        wallet: wallet,
        walletDetails: WalletDetails(
          walletAddress: wallet.privateKey.address.hex,
          walletAlias: walletAlias,
        ),
      ),
    );
  }

  @override
  Future<void> sendAmount(
      {required String fromAddress, required String toAddress, required String denom, required String amount}) async {
    final apiUrl = baseEnv.baseEthUrl; //Replace with your API

    final httpClient = Client();
    final ethClient = Web3Client(apiUrl, httpClient);

    final privateEthCredentials = EthPrivateKey.fromHex(privateKey!);

    await ethClient.sendTransaction(
      privateEthCredentials,
      Transaction(
        to: EthereumAddress.fromHex(toAddress),
        gasPrice: EtherAmount.inWei(BigInt.one),
        maxGas: 100000,
        value: EtherAmount.fromUnitAndValue(EtherUnit.ether, amount),
      ),
    );
  }
}
