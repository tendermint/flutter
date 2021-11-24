import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBottomSheetContainer extends StatelessWidget {
  final Widget child;

  const CosmosBottomSheetContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.elliptical(
            theme.radiusL,
            theme.radiusL * 1.1,
          ),
        ),
        color: theme.colors.background,
      ),
      child: child,
    );
  }
}
