import 'package:flutter/material.dart';
import 'package:flutter_app/api_calls/base_wallet_api.dart';
import 'package:flutter_app/api_calls/cosmos_api.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/models/balances.dart';
import 'package:flutter_app/models/cosmos_wallet.dart';

class WalletDetailsPage extends StatefulWidget {
  final BaseWalletDetails wallet;
  final String alias;

  WalletDetailsPage({
    required this.wallet,
    required this.alias,
  });

  @override
  _WalletDetailsPageState createState() => _WalletDetailsPageState();
}

class _WalletDetailsPageState extends State<WalletDetailsPage> {
  BalancesModel? model;
  bool _isSendMoneyLoading = false;
  bool _isLoading = false;
  String _amount = '';
  String _toAddress = '';

  List<Widget> icons = <Icon>[
    Icon(Icons.wifi_tethering),
    Icon(Icons.workspaces_filled),
    Icon(Icons.workspaces_filled),
  ];

  String _errorText = '';

  BaseWalletApi? api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchWalletDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.alias}\'s Wallet'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text('Wallet address'),
            subtitle: Text(widget.wallet.walletAddress),
          ),
          Divider(),
          Padding(padding: const EdgeInsets.only(top: 16)),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child: Text(
              'Balances',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          if (_isLoading)
            Center(child: CircularProgressIndicator())
          else
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:
                    model!.balances.map((e) => _buildCard(e, context)).toList(),
              ),
            ),
          if (_isSendMoneyLoading)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                  child: Text(
                'Sending your money\nPlease wait ...',
                textAlign: TextAlign.center,
              )),
            ),
          if (_errorText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Center(
                  child: Text(
                _errorText,
                textAlign: TextAlign.center,
              )),
            ),
        ],
      ),
    );
  }

  Card _buildCard(Balances e, BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(e.denom),
        subtitle: Text(e.amount),
        leading: icons[model!.balances.indexOf(
          model!.balances.firstWhere((element) => element == e),
        )],
        trailing: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
          ),
          onPressed: _isSendMoneyLoading
              ? null
              : () async {
                  await showMoneyTransferBottomSheet(context, e);
                },
          child: Text('Transfer'),
        ),
      ),
    );
  }

  Future showMoneyTransferBottomSheet(BuildContext context, Balances e) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.only(top: 16)),
            Text(
              'Send ${e.denom}',
              style: Theme.of(context).textTheme.headline6,
            ),
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Enter wallet address',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  _toAddress = value;
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                decoration: InputDecoration(
                    labelText: 'Enter amount', border: OutlineInputBorder()),
                onChanged: (value) {
                  _amount = value;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await _sendMoney(e);
              },
              child: Text('Send money'),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _sendMoney(Balances e) async {
    _isSendMoneyLoading = true;
    setState(() {});
    try {
      api = widget.wallet.walletType == WalletType.Cosmos ? cosmosApi : ethApi;
      await api!.sendAmount(
        denom: e.denom,
        amount: _amount,
        toAddress: _toAddress,
        fromAddress: widget.wallet.walletAddress,
      );
      await Future.delayed(Duration(seconds: 2));
      _fetchWalletDetails();
      _isSendMoneyLoading = false;
      setState(() {});
    } catch (ex) {
      _isSendMoneyLoading = false;
      _errorText = ex.toString();
      setState(() {});
    }
  }

  void _fetchWalletDetails() async {
    _isLoading = true;
    setState(() {});
    api = widget.wallet.walletType == WalletType.Cosmos ? cosmosApi : ethApi;
    var response = await api!.getWalletBalances(widget.wallet.walletAddress);
    model = response;
    _isLoading = false;
    setState(() {});
  }
}
