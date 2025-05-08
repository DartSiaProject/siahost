import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  /// Formatted date string
  /// the format is day.month.year hour:minute
  /// e.g. 01.01.2022 12:00
  /// Using intl package for formatting
  String get formattedAsDateString {
    return DateFormat('dd.MM.yyyy HH:mm').format(this);
  }
}
