import 'package:flutter_app/domain/use_cases/import_wallet_use_case.dart';
import 'package:flutter_app/navigation/app_navigator.dart';
import 'package:flutter_app/presentation/routing/routing_presentation_model.dart';
import 'package:flutter_app/presentation/routing/routing_presenter.dart';
import 'package:flutter_app/presentation/wallets_list/wallets_list_presentation_model.dart';
import 'package:flutter_app/presentation/wallets_list/wallets_list_presenter.dart';
import 'package:flutter_app/ui/pages/routing/routing_navigator.dart';
import 'package:flutter_app/ui/pages/wallets_list/wallets_list_navigator.dart';
import 'package:flutter_app/utils/app_initializer.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

/// registers all the dependencies in dependency graph in get_it package
void configureDependencies() {
  _configureGeneralDependencies();
  _configureUseCases();
  _configureMvp();
}

void _configureGeneralDependencies() {
  getIt.registerFactory<AppNavigator>(
    () => AppNavigator(),
  );
  getIt.registerFactory<AppInitializer>(
    () => AppInitializer(),
  );
}

void _configureUseCases() {
  getIt.registerFactory<ImportWalletUseCase>(
    () => ImportWalletUseCase(),
  );
}

void _configureMvp() {
  getIt.registerFactoryParam<WalletsListPresenter, WalletsListPresentationModel, dynamic>(
    (_model, _) => WalletsListPresenter(_model!, getIt(), getIt()),
  );
  getIt.registerFactory<WalletsListNavigator>(
    () => WalletsListNavigator(getIt()),
  );

  getIt.registerFactoryParam<RoutingPresenter, RoutingPresentationModel, dynamic>(
    (_model, _) => RoutingPresenter(_model!, getIt(), getIt()),
  );
  getIt.registerFactory<RoutingNavigator>(
    () => RoutingNavigator(getIt()),
  );
}
