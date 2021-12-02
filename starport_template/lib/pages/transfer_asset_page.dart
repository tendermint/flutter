import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/widgets/balance_card_list.dart';

class TransferAssetPage extends StatelessWidget {
  final Balance balance;

  const TransferAssetPage({Key? key, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: CosmosAppBar(
        leading: const CosmosBackButton(),
        title: 'Transfer ${balance.denom.text}',
      ),
      body: Column(
        children: [
          SizedBox(height: theme.spacingXXXL),
          CosmosBalanceCard(
            denomText: balance.denom.text,
            amountDisplayText: balance.amount.displayText,
            isListTileType: true,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
            child: Column(
              children: [
                CosmosTextField(
                  onChanged: (value) {},
                  hint: "Enter receiver's wallet address",
                  suffix: CosmosTextButton(onTap: () {}, text: 'Paste', color: CosmosTheme.of(context).colors.link),
                  // maxLength: null,
                ),
                CosmosTextField(
                  onChanged: (value) {},
                  hint: '0 ${balance.denom.text.toUpperCase()}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CosmosTextField extends StatefulWidget {
  final String text;
  final String hint;
  final Function(String) onChanged;
  final int? maxLines;
  final int maxLength;
  final Widget? suffix;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength = 50,
    this.text = '',
    this.maxLines,
    this.suffix,
    this.hint = '',
  }) : super(key: key);

  @override
  State<CosmosTextField> createState() => _CosmosTextFieldState();
}

class _CosmosTextFieldState extends State<CosmosTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.text = widget.text;
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return TextField(
      controller: controller,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      onChanged: (value) {
        widget.onChanged(value);
        setState(() {});
      },
      decoration: InputDecoration(
        border: UnderlineInputBorder(borderSide: BorderSide(color: theme.colors.inputBorder)),
        hintText: widget.hint,
        hintStyle: CosmosTextTheme.copy0Normal,
        counterText: '',
        suffixIcon: controller.text.isNotEmpty ? null : widget.suffix,
        suffix: widget.suffix != null ? (controller.text.isNotEmpty ? buildInkWell() : null) : buildInkWell(),
      ),
    );
  }

  InkWell buildInkWell() {
    return InkWell(
      onTap: () {
        controller.clear();
        widget.onChanged('');
        setState(() {});
      },
      child: SizedBox(
        height: 17,
        width: 17,
        child: Image.asset('assets/images/cross.png', package: packageName),
      ),
    );
  }
}
