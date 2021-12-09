import 'package:flutter/foundation.dart';

class CosmosModalAction {
  final String text;
  final VoidCallback onPressed;
  final bool isCriticalAction;

  const CosmosModalAction({
    required this.text,
    required this.onPressed,
    this.isCriticalAction = false,
  });
}
