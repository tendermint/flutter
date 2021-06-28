import 'package:flutter/material.dart';

class EmptyListMessage extends StatelessWidget {
  final String message;

  const EmptyListMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.grey),
      ),
    );
  }
}
