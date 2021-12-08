import 'package:clipboard/clipboard.dart';
import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_container.dart';
import 'package:cosmos_ui_components/components/cosmos_bottom_sheet_header.dart';
import 'package:cosmos_ui_components/components/cosmos_text_button.dart';
import 'package:cosmos_ui_components/components/gradient_avatar.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:cosmos_utils/address_parser.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:transaction_signing_gateway/model/wallet_public_info.dart';

class ReceiveMoneySheet extends StatelessWidget {
  final WalletPublicInfo walletInfo;

  const ReceiveMoneySheet({Key? key, required this.walletInfo}) : super(key: key);

  String get convertedAddress => bech32ToHex(walletInfo.publicAddress);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return CosmosBottomSheetContainer(
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
              SizedBox(height: 35, child: GradientAvatar(stringKey: walletInfo.publicAddress)),
              SizedBox(width: theme.spacingL),
              Text(walletInfo.name, style: CosmosTextTheme.title1Medium)
            ],
          ),
          SizedBox(height: theme.spacingL),
          Text(maskAddress(convertedAddress), style: CosmosTextTheme.title1Medium),
          const Spacer(),
          CosmosTextButton(
            text: 'Share',
            onTap: () => Share.share(convertedAddress),
            textStyle: CosmosTextTheme.elevatedButton.copyWith(color: theme.colors.link),
            suffixIcon: Image.asset('assets/images/share.png'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacingL),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => FlutterClipboard.copy(convertedAddress),
                    child: const Text('Copy address'),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: theme.spacingXXXL)
        ],
      ),
    );
  }
}

String maskAddress(String address) {
  return '${address.substring(0, 9)}...${address.substring(address.length - 4)}';
}
