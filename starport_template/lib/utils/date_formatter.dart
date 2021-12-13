import 'package:intl/intl.dart';

String formatDate(DateTime date, DateFormatEnum dateFormat) => DateFormat(getDateFormat[dateFormat]).format(date);

abstract class DateFormats {
  static const String UIShortDate = 'MMM d';
  static const String groupByMonthYear = 'MMMM-yyyy';
}

enum DateFormatEnum { ShortUIDateDay, GroupByMonthYear }

Map<DateFormatEnum, String> getDateFormat = {
  DateFormatEnum.ShortUIDateDay: DateFormats.UIShortDate,
  DateFormatEnum.GroupByMonthYear: DateFormats.groupByMonthYear,
};
