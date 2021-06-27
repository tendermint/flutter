import 'package:flutter/material.dart';

class ContentLoadingIndicator extends StatelessWidget {
  const ContentLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}
