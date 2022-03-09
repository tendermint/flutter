import 'package:clipboard/clipboard.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transaction_signing_gateway/transaction_signing_gateway.dart';

class ReceiveMoneySheet extends StatelessWidget {
  const ReceiveMoneySheet({
    required this.accountInfo,
    Key? key,
  }) : super(key: key);

  final AccountPublicInfo accountInfo;

  String get accountAddress => accountInfo.publicAddress;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return CosmosBottomSheetContainer(
      child: SafeArea(
        child: Column(
          children: [
            CosmosBottomSheetHeader(
              title: '',
              titleTextStyle: CosmosTextTheme.title2Bold,
              leading: const Icon(Icons.ten_k, color: Colors.transparent),
              actions: [
                CosmosTextButton(
                  text: 'Close',
                  onTap: () => Navigator.of(context).pop(),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 5,
              ),
              child: CosmosQrImage(
                data: accountInfo.publicAddress,
              ),
            ),
            SizedBox(height: theme.spacingXXL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  child: GradientAvatar(stringKey: accountInfo.publicAddress),
                ),
                SizedBox(width: theme.spacingL),
                Text(
                  accountInfo.name,
                  style: CosmosTextTheme.title1Medium,
                )
              ],
            ),
            SizedBox(height: theme.spacingL),
            Text(
              maskAddress(accountAddress),
              style: CosmosTextTheme.title1Medium,
            ),
            const Spacer(),
            CosmosTextButton(
              text: 'Share',
              onTap: _onTapShare,
              textStyle: CosmosTextTheme.elevatedButton.copyWith(color: theme.colors.link),
              suffixIcon: Image.asset('assets/images/share.png'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
              child: Row(
                children: [
                  Expanded(
                    child: CosmosElevatedButton(
                      onTap: _onTapCopyAddress,
                      text: 'Copy address',
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: theme.spacingL)
          ],
        ),
      ),
    );
  }

  void _onTapCopyAddress() => FlutterClipboard.copy(accountAddress);

  void _onTapShare() => Share.share(accountAddress);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<AccountPublicInfo>('accountInfo', accountInfo))
      ..add(StringProperty('accountAddress', accountAddress));
  }
}

String maskAddress(String address) => '${address.substring(0, 9)}...${address.substring(address.length - 4)}';
