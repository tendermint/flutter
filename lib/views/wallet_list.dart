import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/api_calls/wallet_api.dart';
import 'package:flutter_app/models/wallet_details.dart';
import 'package:flutter_app/views/wallet_details_page.dart';

import '../global.dart';

class WalletListingPage extends StatefulWidget {
  @override
  _WalletListingPageState createState() => _WalletListingPageState();
}

class _WalletListingPageState extends State<WalletListingPage> {
  List<WalletDetails> list = [];
  String _mnemonic = '';
  String _alias = '';
  WalletApi api = WalletApi();

  @override
  Widget build(BuildContext context) {
    list = globalCache.wallets;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tendermint 1.0.2'),
      ),
      body: list.isEmpty
          ? Center(
              child: Text(
                'No wallets found. Add one.',
                style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: list
                    .map(
                      (e) => Card(
                        elevation: 4,
                        child: ListTile(
                          title: Text(e.walletAlias.toString()),
                          subtitle: Text(e.walletAddress),
                          isThreeLine: true,
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  FlutterClipboard.copy(e.walletAddress);
                                },
                                child: const Icon(Icons.copy),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => WalletDetailsPage(
                                  walletAddress: e.walletAddress,
                                  alias: e.walletAlias,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter mnemonic',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _mnemonic = value;
                      },
                    ),
                  ),
                  ListTile(
                    title: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Enter alias',
                        border: OutlineInputBorder(),
                      ),
                      onChanged: (value) {
                        _alias = value;
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      api.importWallet(
                        mnemonicString: _mnemonic,
                        walletAlias: _alias,
                      );
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                    ),
                    child: const Text('Add wallet'),
                  ),
                ],
              ),
            ),
          );
        },
        label: const Text('Import a wallet'),
      ),
    );
  }
}
