import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/msg_send_transaction.dart';
import 'package:starport_template/pages/custom_fee_page.dart';
import 'package:starport_template/pages/sign_transaction_page.dart';
import 'package:starport_template/utils/amount_validator.dart';
import 'package:starport_template/widgets/send_money_form.dart';

class TransferAssetPage extends StatefulWidget {
  final Balance balance;

  const TransferAssetPage({Key? key, required this.balance}) : super(key: key);

  @override
  State<TransferAssetPage> createState() => _TransferAssetPageState();
}

class _TransferAssetPageState extends State<TransferAssetPage> {
  double amount = 0.0;
  double fee = 0.02;
  String walletAddress = '';

  bool get isTransferValidated => amount != 0.0 && walletAddress.isNotEmpty && fee != 0.0;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: CosmosAppBar(
        leading: const CosmosBackButton(),
        title: 'Transfer ${widget.balance.denom.text}',
      ),
      body: Column(
        children: [
          SizedBox(height: theme.spacingXXXL),
          CosmosBalanceCard(
            denomText: widget.balance.denom.text,
            amountDisplayText: widget.balance.amount.displayText,
            secondaryText: 'available ${widget.balance.denom.text.toUpperCase()}',
            isListTileType: true,
          ),
          SizedBox(height: theme.spacingXXL),
          SendMoneyForm(
            onAddressChanged: (value) {
              walletAddress = value;
              setState(() {});
            },
            onAmountChanged: (value) {
              amount = validateAmount(value);
              setState(() {});
            },
            onFeeChanged: (value) {
              fee = validateAmount(value);
              setState(() {});
            },
            denomText: widget.balance.denom.text,
          ),
          SizedBox(height: theme.spacingXL),
          _customFee(theme),
          const Spacer(),
          _footerButton(theme),
        ],
      ),
    );
  }

  Widget _customFee(CosmosThemeData theme) {
    return InkWell(
      onTap: () async {
        fee = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CustomFeePage(denomText: widget.balance.denom.text, initialFee: fee),
              ),
            ) as double? ??
            0.0;
        setState(() {});
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
        child: Row(
          children: [
            Text('Fees', style: CosmosTextTheme.copy0Normal),
            const Spacer(),
            Text('${fee.toString()} AKT'),
            Image.asset('assets/images/arrow_right.png'),
          ],
        ),
      ),
    );
  }

  SafeArea _footerButton(CosmosThemeData theme) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: CosmosElevatedButton(
                text: 'Continue',
                onTap: isTransferValidated ? _onTapContinue : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onTapContinue() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignTransactionPage(
          transaction: MsgSendTransaction(
            amount: Amount.fromString(amount.toString()),
            fee: fee,
            recipient: walletAddress,
          ),
          balance: widget.balance,
        ),
      ),
    );
  }
}
