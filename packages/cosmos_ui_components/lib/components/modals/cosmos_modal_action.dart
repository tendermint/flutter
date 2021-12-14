import 'package:flutter/foundation.dart';

class CosmosModalAction {
  const CosmosModalAction({
    required this.text,
    required this.onPressed,
    this.isCriticalAction = false,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isCriticalAction;
}
