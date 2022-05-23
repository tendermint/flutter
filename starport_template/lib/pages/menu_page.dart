import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  AccountPublicInfo get selectedAccount => StarportApp.accountsStore.selectedAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset('assets/images/svg/close.svg'),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.all(CosmosTheme.of(context).spacingL),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 35,
                      child: InkWell(
                        onTap: () {},
                        child: GradientAvatar(stringKey: selectedAccount.publicAddress),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(0, 0, 0, 0.07),
                ),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/svg/wallet.svg'),
                  const Text('Wallet'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AccountPublicInfo>('selectedAccount', selectedAccount));
  }
}
