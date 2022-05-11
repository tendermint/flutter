import 'package:clipboard/clipboard.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/entities/transaction_history_item.dart';
import 'package:starport_template/entities/wallet_additional_data.dart';
import 'package:starport_template/pages/receive_money_sheet.dart';
import 'package:starport_template/pages/settings_sheet.dart';
import 'package:starport_template/pages/wallets_list_sheet.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/asset_portfolio_heading.dart';
import 'package:starport_template/widgets/transaction_history_list.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  State<TransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  WalletPublicInfo get selectedWallet => StarportApp.walletsStore.selectedWallet;

  String get walletAddress => selectedWallet.publicAddress;

  bool get isLoading => StarportApp.transactionsStore.isTransactionHistoryLoading;

  List<TransactionHistoryItem> get transactionsList => StarportApp.transactionsStore.transactionsList;

  @override
  void initState() {
    super.initState();
    StarportApp.transactionsStore.getTransactionHistory(walletAddress);
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _appBar(theme, context),
            SizedBox(height: theme.spacingM),
            _gradientAvatar(context),
            AssetPortfolioHeading(title: selectedWallet.name, onTap: _onDropDownTapped, isCentered: true),
            _textButtonRow(context, theme),
            if (!selectedWallet.data.isBackedUp)
              Padding(
                padding: EdgeInsets.all(theme.spacingL),
                child: CosmosWarningBox(
                  text: 'Back up your account',
                  suffix: Image.asset('assets/images/arrow_right.png'),
                ),
              ),
            _transactionHistory(),
          ],
        ),
      ),
    );
  }

  Expanded _transactionHistory() {
    return Expanded(
      child: Observer(
        builder: (context) {
          return ContentStateSwitcher(
            contentChild: TransactionHistoryList(transactionsList: transactionsList),
            isLoading: isLoading,
          );
        },
      ),
    );
  }

  Padding _appBar(CosmosThemeData theme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: theme.spacingXL, left: theme.spacingL, right: theme.spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CosmosImageButton(
            asset: 'assets/images/settings.png',
            onTap: _onTapSettings,
          ),
          CosmosImageButton(
            asset: 'assets/images/arrow_right.png',
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Row _textButtonRow(BuildContext context, CosmosThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CosmosTextButton(
          text: 'Copy address',
          onTap: _onTapCopyAddress,
          textStyle: CosmosTextTheme.elevatedButton.copyWith(
            color: CosmosTheme.of(context).colors.link,
          ),
        ),
        SizedBox(width: theme.spacingL),
        CosmosTextButton(
          text: 'Receive',
          onTap: _onTapReceive,
          textStyle: CosmosTextTheme.elevatedButton.copyWith(
            color: CosmosTheme.of(context).colors.link,
          ),
        ),
      ],
    );
  }

  Widget _gradientAvatar(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
        child: SizedBox(height: 48, child: GradientAvatar(stringKey: walletAddress)),
      ),
    );
  }

  Future<void> _onDropDownTapped() async {
    final wallet = await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.06,
        child: const WalletsListSheet(),
      ),
    ) as WalletPublicInfo?;

    if (wallet != null) {
      StarportApp.walletsStore.selectWallet(wallet);
      await StarportApp.transactionsStore.getTransactionHistory(walletAddress);
    }
  }

  void _onTapCopyAddress() => FlutterClipboard.copy(walletAddress);

  void _onTapReceive() {
    showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height / 1.06,
        child: ReceiveMoneySheet(walletInfo: selectedWallet),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(IterableProperty<TransactionHistoryItem>('transactionsList', transactionsList))
      ..add(DiagnosticsProperty<WalletPublicInfo>('selectedWallet', selectedWallet))
      ..add(StringProperty('walletAddress', walletAddress))
      ..add(DiagnosticsProperty<bool>('isLoading', isLoading));
  }

  Future<void> _onTapSettings() async {
    await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const CosmosBottomSheetContainer(
        child: SettingsSheet(),
      ),
    );
  }
}
