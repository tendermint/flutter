import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:flutter/material.dart';

class BackupAccountCard extends StatelessWidget {
  final VoidCallback? onTap;

  const BackupAccountCard({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(theme.spacingL),
        padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: theme.colors.inactive),
        ),
        child: Row(
          children: [
            Image.asset('assets/images/warning.png'),
            SizedBox(width: theme.spacingL),
            const Text('Back up your account'),
            const Spacer(),
            Image.asset('assets/images/arrow_right.png'),
          ],
        ),
      ),
    );
  }
}
