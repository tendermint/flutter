import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/navigation/app_navigator.dart';
import 'package:flutter_app/navigation/error_dialog_route.dart';
import 'package:flutter_app/navigation/no_routes.dart';
import 'package:flutter_app/presentation/wallets_list/wallets_list_initial_params.dart';
import 'package:flutter_app/ui/pages/add_wallet/add_wallet_bottom_sheet.dart';
import 'package:flutter_app/ui/pages/wallets_list/wallets_list_page.dart';
import 'package:flutter_app/views/wallet_details_page.dart';

class WalletsListNavigator with NoRoutes, AddWalletRoute, ErrorDialogRoute, WalletDetailsRoute {
  @override
  late BuildContext context;
  @override
  final AppNavigator appNavigator;

  WalletsListNavigator(this.appNavigator);
}

abstract class WalletsListRoute {
  Future<void> openWalletsList(WalletsListInitialParams initialParams) async => materialRoute(
        const WalletsListPage(
          initialParams: WalletsListInitialParams(),
        ),
      );

  AppNavigator get appNavigator;

  BuildContext get context;

  factory WalletsListRoute._() => throw UnsupportedError("This class is meant to be mixed in");
}
