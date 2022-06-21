import 'package:alan/alan.dart';
import 'package:cosmos_auth/auth/cosmos_auth.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/app_config.dart';
import 'package:starport_template/pages/routing_page.dart';
import 'package:starport_template/stores/accounts_store.dart';
import 'package:starport_template/stores/settings_store.dart';
import 'package:starport_template/stores/theme_store.dart';
import 'package:starport_template/stores/transactions_store.dart';
import 'package:transaction_signing_gateway/gateway/transaction_signing_gateway.dart';

class StarportApp extends StatelessWidget {
  const StarportApp({
    Key? key,
  }) : super(key: key);

  static late TransactionSigningGateway signingGateway;
  static late AccountsStore accountsStore;
  static late TransactionsStore transactionsStore;
  static late AppConfig appConfig;
  static late NetworkInfo networkInfo;
  static late SecureDataStore secureDataStore;
  static late SettingsStore settingsStore;
  static late ThemeStore themeStore;
  static late CosmosAuth cosmosAuth;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => CosmosTheme(
        brightness: themeStore.isDarkTheme ? Brightness.dark : Brightness.light,
        child: Builder(
          builder: (context) {
            setErrorBuilder(context);
            return MaterialApp(
              title: 'Starport template',
              theme: CosmosTheme.of(context).buildFlutterTheme(),
              home: const RoutingPage(),
            );
          },
        ),
      ),
    );
  }

  void setErrorBuilder(BuildContext context) {
    ErrorWidget.builder = (errorDetails) {
      return Material(
        color: Colors.white,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                const Text(
                  'Error!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  errorDetails.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    CosmosElevatedButton(
                      text: 'Take me back',
                      onTap: () => Navigator.pop(context),
                      textColor: Colors.black,
                    ),
                    CosmosTextButton(
                      text: 'Back',
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    };
  }
}
