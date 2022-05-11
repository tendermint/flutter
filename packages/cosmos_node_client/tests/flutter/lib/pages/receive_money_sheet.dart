import 'package:clipboard/clipboard.dart';
import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_container.dart';
import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_header.dart';
import 'package:cosmos_ui_components/components/cosmos_text_button.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class ReceiveMoneySheet extends StatelessWidget {
  const ReceiveMoneySheet({
    required this.walletInfo,
    Key? key,
  }) : super(key: key);

  final WalletPublicInfo walletInfo;

  String get walletAddress => walletInfo.publicAddress;

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
              actions: [CosmosTextButton(text: 'Close', onTap: () => Navigator.of(context).pop())],
            ),
            QrImage(
              data: walletInfo.publicAddress,
              size: MediaQuery.of(context).size.height / 3.515,
            ),
            SizedBox(height: theme.spacingXXL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                  child: GradientAvatar(stringKey: walletInfo.publicAddress),
                ),
                SizedBox(width: theme.spacingL),
                Text(
                  walletInfo.name,
                  style: CosmosTextTheme.title1Medium,
                )
              ],
            ),
            SizedBox(height: theme.spacingL),
            Text(maskAddress(walletAddress), style: CosmosTextTheme.title1Medium),
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
                    child: ElevatedButton(
                      onPressed: _onTapCopyAddress,
                      child: const Text('Copy address'),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapCopyAddress() => FlutterClipboard.copy(walletAddress);

  void _onTapShare() => Share.share(walletAddress);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<WalletPublicInfo>('walletInfo', walletInfo))
      ..add(StringProperty('walletAddress', walletAddress));
  }
}

String maskAddress(String address) => '${address.substring(0, 9)}...${address.substring(address.length - 4)}';
