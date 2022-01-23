import 'package:cosmos_ui_components/components/template/settings_item.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/pages/security_sheet.dart';
import 'package:starport_template/widgets/app_version_text.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    final textStyle = CosmosTextTheme.copy0Normal.copyWith(color: CosmosTheme.of(context).colors.link);
    return Column(
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
          onTap: () => _onTapSecurity(context),
        ),
        SizedBox(height: theme.spacingXL),
        SettingsItem(
          text: 'Join the Telegram community',
          textStyle: textStyle,
          onTap: () => notImplemented(context),
        ),
        SettingsItem(
          text: 'Twitter',
          textStyle: textStyle,
          onTap: () => notImplemented(context),
        ),
        SettingsItem(
          text: 'Starport',
          textStyle: textStyle,
          onTap: () => notImplemented(context),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(left: theme.spacingXL, bottom: theme.spacingXXL),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AppVersionText(appInfoProvider: AppInfoProvider()),
          ),
        ),
        MinimalBottomSpacer(padding: theme.spacingXXXL)
      ],
    );
  }

  Future<void> _onTapSecurity(BuildContext context) async {
    await showMaterialModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => const CosmosBottomSheetContainer(
        child: SecuritySheet(),
      ),
    );
  }
}
