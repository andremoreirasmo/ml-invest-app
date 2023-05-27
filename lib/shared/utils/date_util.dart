import 'package:intl/intl.dart';

class DateUtil {
  static String formatDate(String format, DateTime date) {
    final formatter = DateFormat(format);
    return formatter.format(date);
  }

  static String formatDateInFull(DateTime date) {
    final formatter = DateFormat('dd \'de\' MMM. \'de\' y');
    return formatter.format(date);
  }

  static String formatDateWithTime(DateTime? date) {
    if (date == null) {
      return '';
    }

    return DateFormat('dd/MM/yy - HH:mm').format(date);
  }

  static DateTime dateFromUTCZero(String date) {
    return DateTime.parse(date).toLocal().add(const Duration(hours: -3));
  }

  static int daysBetween(DateTime d1, DateTime d2) {
    Duration difference = d1.difference(d2);
    return difference.inDays;
  }
}
