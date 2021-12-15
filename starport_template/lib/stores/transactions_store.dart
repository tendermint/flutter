import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:starport_template/entities/transaction_history_item.dart';
import 'package:starport_template/utils/base_env.dart';
import 'package:starport_template/utils/cosmos_transaction_history_loader.dart';

class TransactionsStore {
  TransactionsStore(this.baseEnv);

  final BaseEnv baseEnv;
  final Observable<bool> _isTransactionHistoryLoading = Observable(false);
  final Observable<bool> _isTransactionHistoryError = Observable(false);

  final ObservableList<TransactionHistoryItem> transactionsList = ObservableList();

  bool get isTransactionHistoryLoading => _isTransactionHistoryLoading.value;

  set isTransactionHistoryLoading(bool val) => Action(() => _isTransactionHistoryLoading.value = val)();

  bool get isTransactionHistoryError => _isTransactionHistoryError.value;

  set isTransactionHistoryError(bool val) => Action(() => _isTransactionHistoryError.value = val)();

  Future<void> getTransactionHistory(String walletAddress) async {
    isTransactionHistoryLoading = true;
    try {
      final list = await CosmosTransactionHistoryLoader(baseEnv).getTransactionHistory(walletAddress);
      transactionsList
        ..clear()
        ..addAll(list);
    } catch (ex, stack) {
      logError(ex, stack);
      isTransactionHistoryError = true;
    }
    isTransactionHistoryLoading = false;
  }
}
