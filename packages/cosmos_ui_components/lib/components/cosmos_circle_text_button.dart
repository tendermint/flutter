import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosCircleTextButton extends StatelessWidget {
  const CosmosCircleTextButton({
    required this.text,
    required this.asset,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final String asset;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    final isEnabled = onTap != null;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: theme.spacingL,
        vertical: theme.spacingM,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            SizedBox(
              height: 24,
              width: 24,
              child: Image.asset(
                asset,
                color: isEnabled ? theme.colors.text : theme.colors.inactive,
              ),
            ),
            SizedBox(width: theme.spacingL),
            Text(
              text,
              style: CosmosTextTheme.copy0Normal.copyWith(
                color: isEnabled ? theme.colors.text : theme.colors.inactive,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('asset', asset))
      ..add(StringProperty('text', text))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
