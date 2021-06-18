import 'dart:math';
import 'package:flutter_app/api_calls/base_wallet_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/eth_wallet.dart';
import 'package:http/http.dart';
import 'package:wallet_core/wallet_core.dart';

class EthApi extends BaseWalletApi {
  String? privateKey;

  @override
  Future<BalancesModel> getWalletBalances(String walletAddress) async {
    var apiUrl = "HTTP://127.0.0.1:7545"; //Replace with your API

    var httpClient = new Client();
    var ethClient = new Web3Client(apiUrl, httpClient);

    EtherAmount balance = await ethClient.getBalance(
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
  void importWallet(
      {required String mnemonicString, required String walletAlias}) {
    var rng = new Random.secure();
    privateKey = Web3.privateKeyFromMnemonic(mnemonicString);
    var privateEthCredentials = EthPrivateKey.fromHex(privateKey!);
    Wallet wallet = Wallet.createNew(privateEthCredentials, 'Hello', rng);
    globalCache.wallets.add(
      EthWallet(
          walletAddress: wallet.privateKey.address.hex,
          walletAlias: walletAlias,
          wallet: wallet),
    );
  }

  @override
  Future<void> sendAmount(
      {required String fromAddress,
      required String toAddress,
      required String denom,
      required String amount}) async {
    var apiUrl = "HTTP://127.0.0.1:7545"; //Replace with your API

    var httpClient = new Client();
    var ethClient = new Web3Client(apiUrl, httpClient);

    var privateEthCredentials = EthPrivateKey.fromHex(privateKey!);

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
