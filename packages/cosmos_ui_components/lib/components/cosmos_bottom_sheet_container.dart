import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/material.dart';

class CosmosBottomSheetContainer extends StatelessWidget {
  const CosmosBottomSheetContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final maxHeight = screenHeight - (screenHeight / 10);
    final theme = CosmosTheme.of(context);
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.elliptical(
                theme.radiusXL,
                theme.radiusXL * 1.1,
              ),
            ),
            color: theme.colors.background,
          ),
          child: child,
        ),
      ),
    );
  }
}
