import 'package:flutter/material.dart';

class CosmosWalletListItem extends StatelessWidget {
  final String name;
  final String address;
  final VoidCallback onClicked;

  const CosmosWalletListItem({
    Key? key,
    required this.name,
    required this.address,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Row(
          children: [
            Text(name),
          ],
        ),
        subtitle: Text(address),
        isThreeLine: true,
        onTap: onClicked,
      ),
    );
  }
}
