import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/model/balance_json.dart';
import 'package:http/http.dart' as http;
import 'package:alan/proto/cosmos/bank/v1beta1/export.dart' as bank;
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/model/credentials_storage_failure.dart';
import 'package:transaction_signing_gateway/model/wallet_lookup_key.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';
import 'package:alan/alan.dart' as alan;
import 'package:uuid/uuid.dart';

class WalletsStore {
  final TransactionSigningGateway _transactionSigningGateway;
  final BaseEnv baseEnv;

  WalletsStore(this._transactionSigningGateway, this.baseEnv);

  final Observable<bool> areWalletsLoading = Observable(false);

  final Observable<bool> isSendMoneyLoading = Observable(false);
  final Observable<bool> isBalancesLoading = Observable(false);
  final Observable<bool> isError = Observable(false);

  final Observable<List<Balance>> balancesList = Observable([]);

  final Observable<CredentialsStorageFailure?> loadWalletsFailure = Observable(null);

  Observable<List<WalletPublicInfo>> wallets = Observable([]);

  Future<void> loadWallets() async {
    areWalletsLoading.value = true;
    (await _transactionSigningGateway.getWalletsList()).fold(
      (fail) => loadWalletsFailure.value = fail,
      (newWallets) => wallets.value = newWallets,
    );
    areWalletsLoading.value = false;
  }

  Future<WalletPublicInfo> importAlanWallet(
    String mnemonic,
    String password,
  ) async {
    final wallet = alan.Wallet.derive(mnemonic.split(" "), baseEnv.networkInfo);
    final creds = AlanPrivateWalletCredentials(
      publicInfo: WalletPublicInfo(
        chainId: 'cosmos',
        walletId: const Uuid().v4(),
        name: 'First wallet',
        publicAddress: wallet.bech32Address,
      ),
      mnemonic: mnemonic,
      networkInfo: baseEnv.networkInfo,
    );
    await _transactionSigningGateway.storeWalletCredentials(
      credentials: creds,
      password: password,
    );
    wallets.value.add(creds.publicInfo);
    return creds.publicInfo;
  }

  Future getCosmosBalances(BaseEnv baseEnv, String walletAddress) async {
    isError.value = false;
    isBalancesLoading.value = true;
    try {
      final uri = '${baseEnv.baseApiUrl}/cosmos/bank/v1beta1/balances/$walletAddress';
      final response = await http.get(Uri.parse(uri));
      final map = response.body as Map<String, dynamic>;
      final list = map['balances'] as List<Map<String, dynamic>>;
      var balanceList = <BalanceJson>[];
      if (list.isNotEmpty) {
        balanceList = list.map((e) => BalanceJson.fromJson(e)).toList();
      }

      balancesList.value = balanceList
          .map(
            (e) => Balance(
              denom: Denom(e.denom),
              amount: Amount.fromString(e.amount),
            ),
          )
          .toList();
      isBalancesLoading.value = false;
    } catch (ex) {
      debugPrint(ex.toString());
      isError.value = true;
      isBalancesLoading.value = false;
    }
  }

  Future sendCosmosMoney(
    WalletPublicInfo info,
    Balance balance,
    String toAddress,
  ) async {
    isSendMoneyLoading.value = true;
    final message = bank.MsgSend.create()
      ..fromAddress = info.publicAddress
      ..toAddress = toAddress;
    message.amount.add(
      alan.Coin.create()
        ..denom = balance.denom.text
        ..amount = balance.amount.value.toString(),
    );

    final unsignedTransaction = UnsignedAlanTransaction(messages: [message]);

    final walletLookupKey = WalletLookupKey(
      walletId: info.walletId,
      chainId: info.chainId,
      password: StarportApp.password,
    );

    final signedAlanTransaction = await _transactionSigningGateway.signTransaction(
      transaction: unsignedTransaction,
      walletLookupKey: walletLookupKey,
    );
    await signedAlanTransaction.fold<Future?>(
      (fail) => null,
      (signedTransaction) => _transactionSigningGateway.broadcastTransaction(
          walletLookupKey: walletLookupKey, transaction: signedTransaction),
    );
    isSendMoneyLoading.value = false;
  }
}
