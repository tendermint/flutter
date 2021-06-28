import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

AppLocalizations strings = throw StateError("Could not initialize App Localizations");

void initializeAppLocalizations(BuildContext context) {
  strings = AppLocalizations.of(context) ?? (throw StateError("Could not initialize App Localizations"));
}
