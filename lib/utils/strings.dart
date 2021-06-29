import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

late AppLocalizations strings;

void initializeAppLocalizations(BuildContext context) {
  strings = AppLocalizations.of(context) ?? (throw StateError("Could not initialize App Localizations"));
}
