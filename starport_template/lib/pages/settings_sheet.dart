import 'package:cosmos_ui_components/components/template/settings_item.dart';
import 'package:cosmos_ui_components/cosmos_text_theme.dart';
import 'package:cosmos_ui_components/cosmos_ui_components.dart';
import 'package:cosmos_utils/cosmos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:starport_template/pages/security_sheet.dart';
import 'package:starport_template/starport_app.dart';

class SettingsSheet extends StatelessWidget {
  const SettingsSheet({Key? key}) : super(key: key);

  bool get isDarkTheme => StarportApp.themeStore.isDarkTheme;

  @override
  Widget build(BuildContext context) {
    final theme = CosmosTheme.of(context);
    final textStyle = CosmosTextTheme.copy0Normal.copyWith(color: CosmosTheme.of(context).colors.link);
    return Observer(
      builder: (context) {
        return CosmosBottomSheetContainer(
          child: Column(
            children: [
              CosmosBottomSheetHeader(
                title: 'Settings',
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
                onTap: () => notImplemented(context),
              ),
              SettingsItem(
                text: 'Security',
                onTap: () => _onTapSecurity(context),
              ),
              SettingsItem(
                text: 'Dark theme',
                infoIcon: CosmosSwitch(
                  checked: isDarkTheme,
                  onChanged: (value) => StarportApp.themeStore.isDarkTheme = value,
                ),
                showArrow: false,
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
          ),
        );
      },
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

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<bool>('isDarkTheme', isDarkTheme));
  }
}
