import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return CosmosBottomSheetContainer(
      child: Column(
        children: [
          CosmosBottomSheetHeader(
            title: 'Settings',
            titleTextStyle: CosmosTextTheme.title2Bold,
            leading: const Icon(Icons.ten_k, color: Colors.transparent),
            actions: [
              CosmosTextButton(
                text: 'Close',
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          SizedBox(height: theme.spacingXXL),
          SettingsItem(
            text: 'Backup your account',
            infoIcon: Image.asset('assets/images/icon_warning.png', package: packageName),
            textStyle: CosmosTextTheme.copy0Normal,
            onTap: () => notImplemented(context),
          ),
          SettingsItem(
            text: 'Security',
            textStyle: CosmosTextTheme.copy0Normal,
            onTap: () => notImplemented(context),
          ),
          SizedBox(height: theme.spacingXL),
          SettingsItem(
            text: 'Join the Telegram community',
            textStyle: CosmosTextTheme.copy0Normal.copyWith(color: CosmosTheme.of(context).colors.link),
            onTap: () => notImplemented(context),
          ),
          SettingsItem(
            text: 'Twitter',
            textStyle: CosmosTextTheme.copy0Normal.copyWith(color: CosmosTheme.of(context).colors.link),
            onTap: () => notImplemented(context),
          ),
          SettingsItem(
            text: 'Starport',
            textStyle: CosmosTextTheme.copy0Normal.copyWith(color: CosmosTheme.of(context).colors.link),
            onTap: () => notImplemented(context),
          ),
          const Spacer(),
          // TODO: Pick this version from the actual app version
          Padding(
            padding: EdgeInsets.only(left: theme.spacingXL),
            child: const Align(alignment: Alignment.centerLeft, child: Text('v 1.0')),
          ),
          MinimalBottomSpacer(padding: theme.spacingXXXL)
        ],
      ),
    );
  }
}

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    required this.text,
    required this.textStyle,
    this.infoIcon,
    this.onTap,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle textStyle;
  final Widget? infoIcon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.spacingL, vertical: theme.spacingM),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Text(text, style: textStyle),
            const Spacer(),
            if (infoIcon != null) infoIcon!,
            Image.asset('assets/images/arrow_right.png'),
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
      ..add(DiagnosticsProperty<TextStyle>('textStyle', textStyle))
      ..add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
  }
}
