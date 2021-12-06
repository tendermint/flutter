import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class SendMoneyForm extends StatelessWidget {
  final Function(String) onAddressChanged;
  final Function(String) onAmountChanged;
  final Function(String) onFeeChanged;
  final String denomText;

  const SendMoneyForm({
    Key? key,
    required this.onAddressChanged,
    required this.onAmountChanged,
    required this.onFeeChanged,
    required this.denomText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Column(
        children: [
          CosmosTextField(
            onChanged: (value) => onAddressChanged(value),
            hint: "Enter receiver's wallet address",
            suffix: CosmosTextButton(onTap: () {}, text: 'Paste', color: CosmosTheme.of(context).colors.link),
          ),
          SizedBox(height: theme.spacingL),
          CosmosTextField(
            onChanged: (value) => onAmountChanged(value),
            keyboardType: TextInputType.number,
            hint: '0 ${denomText.toUpperCase()}',
          ),
          SizedBox(height: theme.spacingL),
          CosmosTextField(
            onChanged: (value) => onFeeChanged(value),
            keyboardType: TextInputType.number,
            hint: 'Transaction fee',
          ),
        ],
      ),
    );
  }
}
