import 'package:intl/intl.dart';

class DateTimeDefaults {
  static const String dateFormat = "dd.MM.yyyy";
}

extension DateConverter on DateTime {

  String toDateString() {
    return DateFormat(DateTimeDefaults.dateFormat).format(this);
  }
}