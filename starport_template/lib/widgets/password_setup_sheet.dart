import 'package:flutter/material.dart';

//TODO
class PasswordSetupSheet extends StatelessWidget {
  final void Function(String) submitClicked;

  const PasswordSetupSheet({
    Key? key,
    required this.submitClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Password Setup sheet"),
      ),
    );
  }
}
