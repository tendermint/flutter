import 'package:flutter/material.dart';

class BalanceHeading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      child: Row(
        children: [
          Text(
            'Balances',
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            margin: const EdgeInsets.only(left: 8),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.blueGrey, borderRadius: BorderRadius.circular(20)),
            child: const Text(
              'Cosmos',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          )
        ],
      ),
    );
  }
}
