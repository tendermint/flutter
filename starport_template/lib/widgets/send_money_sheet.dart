import 'package:cosmos_ui_components/components/content_state_switcher.dart';
import 'package:cosmos_ui_components/components/cosmos_elevated_button.dart';
import 'package:cosmos_ui_components/components/template/cosmos_password_field.dart';
import 'package:cosmos_ui_components/components/template/cosmos_wallets_list_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:starport_template/entities/amount.dart';
import 'package:starport_template/entities/balance.dart';
import 'package:starport_template/entities/denom.dart';
import 'package:starport_template/starport_app.dart';
import 'package:starport_template/stores/wallets_store.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class SendMoneySheet extends StatefulWidget {
  const SendMoneySheet({
    required this.denom,
    required this.walletInfo,
    Key? key,
  }) : super(key: key);

  final Denom denom;
  final WalletInfo walletInfo;

  @override
  State<SendMoneySheet> createState() => _SendMoneySheetState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<Denom>('denom', denom))
      ..add(DiagnosticsProperty<WalletInfo>('walletInfo', walletInfo));
  }
}

class _SendMoneySheetState extends State<SendMoneySheet> {
  String toAddress = '';
  String password = '';
  String amount = '';

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ContentStateSwitcher(
        isLoading: StarportApp.walletsStore.isSendMoneyLoading,
        contentChild: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              widget.denom.text,
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              title: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter wallet address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => toAddress = value,
              ),
            ),
            ListTile(
              title: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter amount',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => amount = value,
              ),
            ),
            ListTile(
              title: CosmosPasswordField(
                onPasswordUpdated: (value) => password = value,
              ),
            ),
            CosmosElevatedButton(
              onTap: _onSendMoneyClicked,
              text: 'Send money',
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onSendMoneyClicked() async {
    final amount = Amount.fromString(this.amount);
    final info = WalletPublicInfo(
      name: widget.walletInfo.name,
      publicAddress: widget.walletInfo.address,
      walletId: widget.walletInfo.walletId,
      chainId: WalletsStore.chainId,
    );
    final balance = Balance(denom: widget.denom, amount: amount);
    await StarportApp.walletsStore.sendTokens(info: info, balance: balance, toAddress: toAddress, password: password);
    if (!mounted) {
      return;
    }
    Navigator.of(context).pop(true);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('toAddress', toAddress))
      ..add(StringProperty('amount', amount))
      ..add(StringProperty('password', password));
  }
}
