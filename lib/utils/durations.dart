import 'package:flutter_app/utils/app_theme.dart';

class LongDuration extends Duration {
  const LongDuration() : super(milliseconds: AppTheme.longDuration);
}

class MediumDuration extends Duration {
  const MediumDuration() : super(milliseconds: AppTheme.mediumDuration);
}

class ShortDuration extends Duration {
  const ShortDuration() : super(milliseconds: AppTheme.shortDuration);
}
