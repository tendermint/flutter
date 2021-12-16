import 'dart:io';

import 'package:alan/alan.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/stores/transactions_store.dart';
import 'package:starport_template/stores/wallets_store.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:transaction_signing_gateway/alan/alan_credentials_serializer.dart';
import 'package:transaction_signing_gateway/alan/alan_transaction_broadcaster.dart';
import 'package:transaction_signing_gateway/alan/alan_transaction_signer.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/storage/cosmos_key_info_storage.dart';
import 'package:transaction_signing_gateway/storage/flutter_secure_storage_data_store.dart';
import 'package:transaction_signing_gateway/storage/shared_prefs_plain_data_store.dart';

void main() {
  _buildDependencies();
  runApp(const StarportApp());
}

void _buildDependencies() {
  StarportApp.networkInfo = NetworkInfo(
    bech32Hrp: 'cosmos',
    lcdInfo: LCDInfo(host: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost'),
    grpcInfo: GRPCInfo(host: Platform.isAndroid ? 'http://10.0.2.2' : 'http://localhost'),
  );
  StarportApp.secureDataStore = FlutterSecureStorageDataStore();
  StarportApp.signingGateway = TransactionSigningGateway(
    transactionSummaryUI: NoOpTransactionSummaryUI(),
    signers: [
      AlanTransactionSigner(StarportApp.networkInfo),
    ],
    broadcasters: [
      AlanTransactionBroadcaster(StarportApp.networkInfo),
    ],
    infoStorage: CosmosKeyInfoStorage(
      serializers: [AlanCredentialsSerializer()],
      secureDataStore: StarportApp.secureDataStore,
      plainDataStore: SharedPrefsPlainDataStore(),
    ),
  );
  StarportApp.baseEnv = BaseEnv();
  StarportApp.walletsStore = WalletsStore(StarportApp.signingGateway, StarportApp.baseEnv);
  StarportApp.transactionsStore = TransactionsStore(StarportApp.baseEnv);
}
