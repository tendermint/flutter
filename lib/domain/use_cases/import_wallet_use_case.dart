import 'package:dartz/dartz.dart';
import 'package:flutter_app/domain/entities/import_wallet_form_data.dart';
import 'package:flutter_app/domain/model/failures/add_wallet_failure.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/utils/logger.dart';

class ImportWalletUseCase {
  Future<Either<AddWalletFailure, Unit>> execute({required ImportWalletFormData walletFormData}) async {
    //TODO create fully-fledged wallet manager/repository for this
    try {
      cosmosApi.importWallet(
        mnemonicString: walletFormData.mnemonic,
        walletAlias: walletFormData.alias,
      );
    } catch (e) {
      logError(e);
      return left(const AddWalletFailure.unknown());
    }
    return right(unit);
  }
}
