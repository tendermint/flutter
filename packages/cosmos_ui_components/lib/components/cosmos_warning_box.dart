import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_ui_components/generated_assets/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CosmosWarningBox extends StatelessWidget {
  const CosmosWarningBox({
    required this.text,
    this.asset,
    this.package,
    this.suffix,
    Key? key,
  }) : super(key: key);

  final String text;
  final String? asset;
  final String? package;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Container(
      decoration: BoxDecoration(borderRadius: theme.borderRadiusM, border: Border.all(color: theme.colors.divider)),
      child: Padding(
        padding: EdgeInsets.all(theme.spacingL),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Image.asset(
                asset ?? Assets.images.iconWarning.path,
                package: package ?? (asset == null ? packageName : null),
                width: 16,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: theme.spacingL),
            Text(text, style: CosmosTextTheme.copyMinus1Normal),
            if (suffix != null) ...[
              const Spacer(),
              suffix!,
            ]
          ],
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('text', text))
      ..add(StringProperty('package', package))
      ..add(StringProperty('asset', asset));
  }
}
