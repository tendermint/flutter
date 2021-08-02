import 'package:cosmos_ui_components/cosmos_ui_components.dart';

class LongDuration extends Duration {
  const LongDuration() : super(milliseconds: CosmosAppTheme.longDuration);
}

class MediumDuration extends Duration {
  const MediumDuration() : super(milliseconds: CosmosAppTheme.mediumDuration);
}

class ShortDuration extends Duration {
  const ShortDuration() : super(milliseconds: CosmosAppTheme.shortDuration);
}
