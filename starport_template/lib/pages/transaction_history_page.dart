import 'package:cosmos_ui_components/components/cosmos_image_button.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/entities/transaction.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/widgets/asset_portfolio_heading.dart';
import 'package:starport_template/widgets/back_up_account_card.dart';
import 'package:starport_template/widgets/transaction_history_list.dart';
import 'package:starport_template/widgets/wallets_list_sheet.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class TransactionHistoryPage extends StatefulWidget {
  const TransactionHistoryPage({Key? key}) : super(key: key);

  @override
  _TransactionHistoryPageState createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<TransactionHistoryPage> {
  WalletPublicInfo get selectedWallet => StarportApp.walletsStore.selectedWallet;

  bool get isLoading => StarportApp.walletsStore.isTransactionHistoryLoading;

  List<Transaction> get transactionsList => StarportApp.walletsStore.transactionsList;

  @override
  void initState() {
    super.initState();
    StarportApp.walletsStore.getTransactionHistory();
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
            const BackupAccountCard(),
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
            onTap: () => notImplemented(context),
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
          onTap: () {},
          textStyle: CosmosTextTheme.elevatedButton.copyWith(
            color: CosmosTheme.of(context).colors.link,
          ),
        ),
        SizedBox(width: theme.spacingL),
        CosmosTextButton(
          text: 'Receive',
          onTap: () {},
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
        child: SizedBox(height: 48, child: GradientAvatar(stringKey: selectedWallet.publicAddress)),
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
      StarportApp.walletsStore.getTransactionHistory();
    }
  }
}
