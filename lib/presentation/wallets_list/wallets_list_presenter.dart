import 'package:flutter_app/data/model/emeris_wallet.dart';
import 'package:flutter_app/domain/use_cases/import_wallet_use_case.dart';
import 'package:flutter_app/presentation/wallets_list/wallets_list_presentation_model.dart';
import 'package:flutter_app/ui/pages/wallets_list/wallets_list_navigator.dart';
import 'package:flutter_app/utils/utils.dart';

class WalletsListPresenter {
  final ImportWalletUseCase _addWalletUseCase;

  WalletsListPresenter(
    this._model,
    this.navigator,
    this._addWalletUseCase,
  );

  final WalletsListPresentationModel _model;
  final WalletsListNavigator navigator;

  WalletsListViewModel get viewModel => _model;

  Future<void> addWalletClicked() async {
    final walletFormData = await navigator.openAddWallet();
    if (walletFormData != null) {
      _addWalletUseCase.execute(walletFormData: walletFormData).observableDoOn(
            (fail) => navigator.showError(fail.displayableFailure()),
            (success) => doNothing(),
          );
    }
  }

  void walletClicked(EmerisWallet wallet) => navigator.openWalletDetails(wallet);
}
