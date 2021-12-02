import 'package:flutter/material.dart';

class CosmosTokenAvatar extends StatelessWidget {
  final String text;

  const CosmosTokenAvatar({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        foregroundColor: Colors.black,
        child: Text(text[0].toUpperCase()),
      ),
    );
  }
}
