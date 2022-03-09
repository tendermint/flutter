import 'package:cosmos_ui_components/cosmos_theme.dart';

class LongDuration extends Duration {
  const LongDuration()
      : super(milliseconds: CosmosThemeData.defaultLongDuration);
}

class MediumDuration extends Duration {
  const MediumDuration()
      : super(milliseconds: CosmosThemeData.defaultMediumDuration);
}

class ShortDuration extends Duration {
  const ShortDuration()
      : super(milliseconds: CosmosThemeData.defaultShortDuration);
}
