import 'package:alan/alan.dart';
import 'package:cosmos_auth/cosmos_auth.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/app_config.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/stores/accounts_store.dart';
import 'package:starport_template/stores/settings_store.dart';
import 'package:starport_template/stores/transactions_store.dart';
import 'package:transaction_signing_gateway/mobile/no_op_transaction_summary_ui.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

void main() {
  _buildDependencies();
  runApp(const StarportApp());
}

void _buildDependencies() {
  StarportApp.appConfig = AppConfig();
  StarportApp.networkInfo = StarportApp.appConfig.networkInfo;
  _logBackendInfo(StarportApp.networkInfo);
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

  StarportApp.cosmosAuth = CosmosAuth();
  StarportApp.accountsStore = AccountsStore(StarportApp.signingGateway, StarportApp.appConfig);
  StarportApp.settingsStore = SettingsStore(StarportApp.cosmosAuth, StarportApp.secureDataStore, StarportApp.appConfig);
  StarportApp.transactionsStore = TransactionsStore(StarportApp.appConfig);
}

void _logBackendInfo(NetworkInfo networkInfo) => debugLog(
      '''
    Starting app with following info:
    
    bech32Hrp:\t${networkInfo.bech32Hrp}
    
    LCD : {
      host:\t\t${networkInfo.lcdInfo.host}
      port:\t\t${networkInfo.lcdInfo.port}
      fullUrl:\t${networkInfo.lcdInfo.fullUrl}
    }
      
    GRPC: {
      host:\t\t${networkInfo.grpcInfo.host}
      port:\t\t${networkInfo.grpcInfo.port}
    }
''',
    );
