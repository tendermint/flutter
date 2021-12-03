import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/msg_send_transaction.dart';
import 'package:starport_template/pages/sign_transaction_page.dart';
import 'package:starport_template/widgets/balance_card_list.dart';

class TransferAssetPage extends StatefulWidget {
  final Balance balance;

  const TransferAssetPage({Key? key, required this.balance}) : super(key: key);

  @override
  State<TransferAssetPage> createState() => _TransferAssetPageState();
}

class _TransferAssetPageState extends State<TransferAssetPage> {
  double amount = 0.0;
  double fee = 0.0;
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
            isListTileType: true,
          ),
          SizedBox(height: theme.spacingXXL),
          _buildTextFields(theme, context),
          const Spacer(),
          _buildFooterButton(theme),
        ],
      ),
    );
  }

  void _navigateToSignTransaction() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignTransactionPage(
          transaction: MsgSendTransaction(amount: amount, fee: fee, recipient: walletAddress),
          balance: widget.balance,
        ),
      ),
    );
  }

  Padding _buildTextFields(CosmosThemeData theme, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Column(
        children: [
          CosmosTextField(
            onChanged: (value) {
              walletAddress = value;
              setState(() {});
            },
            hint: "Enter receiver's wallet address",
            suffix: CosmosTextButton(onTap: () {}, text: 'Paste', color: CosmosTheme.of(context).colors.link),
          ),
          SizedBox(height: theme.spacingL),
          CosmosTextField(
            onChanged: (value) {
              amount = _validateAmount(value);
              setState(() {});
            },
            keyboardType: TextInputType.number,
            hint: '0 ${widget.balance.denom.text.toUpperCase()}',
          ),
          SizedBox(height: theme.spacingL),
          CosmosTextField(
            onChanged: (value) {
              fee = _validateAmount(value);
              setState(() {});
            },
            keyboardType: TextInputType.number,
            hint: 'Transaction fee',
          ),
        ],
      ),
    );
  }

  double _validateAmount(String value) {
    if (value.isEmpty) {
      return 0.0;
    }
    final _amount = double.tryParse(value);
    if (_amount != null) {
      return _amount;
    } else {
      return 0.0;
    }
  }

  SafeArea _buildFooterButton(CosmosThemeData theme) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: CosmosElevatedButton(
                text: 'Continue',
                onTap: isTransferValidated ? _navigateToSignTransaction : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
