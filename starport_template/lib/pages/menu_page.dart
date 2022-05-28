import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:starport_template/pages/transaction_history_page.dart';
import 'package:starport_template/starport_app.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  AccountPublicInfo get selectedAccount =>
      StarportApp.accountsStore.selectedAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/images/svg/close.svg'),
                  const Spacer(),
                  SizedBox(
                    height: 35,
                    child: InkWell(
                      onTap: () {
                        
                      },
                      child: GradientAvatar(
                          stringKey: selectedAccount.publicAddress),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 43),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(0, 0, 0, 0.07),
                    ),
                    borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/images/svg/wallet.svg'),
                    const SizedBox(width: 20),
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: CosmosTheme.of(context).fontSizeM,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTapAvatar(BuildContext context) => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const TransactionHistoryPage()),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<AccountPublicInfo>(
        'selectedAccount', selectedAccount));
  }
}
