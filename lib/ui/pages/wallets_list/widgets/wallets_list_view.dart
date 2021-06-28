import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/data/model/emeris_wallet.dart';
import 'package:flutter_app/data/model/wallet_type.dart';

class WalletsListView extends StatelessWidget {
  final List<EmerisWallet> list;
  final void Function(EmerisWallet) walletClicked;

  const WalletsListView({
    Key? key,
    required this.list,
    required this.walletClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: list
          .map(
            (wallet) => Card(
              elevation: 4,
              child: ListTile(
                title: Row(
                  children: [
                    Text(wallet.walletDetails.walletAlias.toString()),
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                          color: wallet.walletType == WalletType.Eth ? Colors.deepPurple : Colors.blueGrey,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        wallet.walletType.toString().split('.')[1],
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    )
                  ],
                ),
                subtitle: Text(wallet.walletDetails.walletAddress),
                isThreeLine: true,
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => FlutterClipboard.copy(wallet.walletDetails.walletAddress), //TODO
                      child: const Icon(Icons.copy),
                    ),
                  ],
                ),
                onTap: () => walletClicked(wallet),
              ),
            ),
          )
          .toList(),
    );
  }
}
