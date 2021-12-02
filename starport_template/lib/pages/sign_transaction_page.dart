import 'package:cosmos_ui_components/components/cosmos_app_bar.dart';
import 'package:cosmos_ui_components/components/cosmos_back_button.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/transaction.dart';
import 'package:starport_template/widgets/sign_transaction_item.dart';

class SignTransactionPage extends StatelessWidget {
  final Transaction transaction;
  final Balance balance;

  const SignTransactionPage({Key? key, required this.transaction, required this.balance}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Scaffold(
      appBar: const CosmosAppBar(
        leading: CosmosBackButton(),
        title: 'Sign Transaction',
      ),
      body: Column(
        children: [
          SizedBox(height: theme.spacingXXL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          SignTransactionItem(text: 'Send', amount: transaction.amount, balance: balance),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          SignTransactionItem(
            text: 'Recipient will get',
            amount: transaction.amount - transaction.fee,
            balance: balance,
          ),
          SizedBox(height: theme.spacingL),
          const CosmosDivider(),
          SizedBox(height: theme.spacingL),
          _buildTransactionFee(theme),
          const Spacer(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      text: 'Tap to sign',
                      prefixIcon: Image.asset('assets/images/face_id.png'),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildTransactionFee(CosmosThemeData theme) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Transaction fee', style: titleS),
          Text(
            '${transaction.fee.toString()} ${balance.denom.text.toUpperCase()}',
            style: CosmosTextTheme.copyMinus1Normal,
          ),
        ],
      ),
    );
  }
}

TextStyle get titleS => const TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w700,
      fontSize: 13,
      height: 1.27,
    );

TextStyle get title1Medium => const TextStyle(
      fontFamily: "Inter",
      fontWeight: FontWeight.w600,
      fontSize: 21,
    );

class CosmosDivider extends StatelessWidget {
  const CosmosDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
      child: Divider(color: theme.colors.inputBorder),
    );
  }
}

class CosmosTokenAvatar extends StatelessWidget {
  final String text;

  const CosmosTokenAvatar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        child: Text(text[0].toUpperCase()),
      ),
    );
  }
}

class CosmosElevatedButton extends StatelessWidget {
  static const defaultHeight = 50.0;

  final VoidCallback? onTap;
  final String text;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double height;

  const CosmosElevatedButton({
    Key? key,
    this.onTap,
    this.text = "",
    this.suffixIcon,
    this.prefixIcon,
    this.height = defaultHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        fixedSize: Size.fromHeight(height),
        shape: RoundedRectangleBorder(borderRadius: CosmosTheme.of(context).borderRadiusM),
        elevation: 0,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (prefixIcon != null) ...[
            prefixIcon!,
            SizedBox(width: CosmosTheme.of(context).spacingM),
          ],
          Text(
            text,
            style: CosmosTextTheme.elevatedButton,
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: CosmosTheme.of(context).spacingM),
            suffixIcon!,
          ],
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
  final TextInputType? keyboardType;

  const CosmosTextField({
    Key? key,
    required this.onChanged,
    this.maxLength = 50,
    this.text = '',
    this.maxLines,
    this.suffix,
    this.hint = '',
    this.keyboardType,
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
      keyboardType: widget.keyboardType,
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
        suffix: widget.suffix != null ? (controller.text.isNotEmpty ? _buildClearButton() : null) : _buildClearButton(),
      ),
    );
  }

  InkWell _buildClearButton() {
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
