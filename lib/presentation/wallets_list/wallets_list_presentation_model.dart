import 'package:flutter_app/presentation/wallets_list/wallets_list_initial_params.dart';

abstract class WalletsListViewModel {}

class WalletsListPresentationModel with WalletsListPresentationModelBase implements WalletsListViewModel {
  final WalletsListInitialParams initialParams;

  WalletsListPresentationModel(this.initialParams);
}

//////////////////BOILERPLATE
abstract class WalletsListPresentationModelBase {}
