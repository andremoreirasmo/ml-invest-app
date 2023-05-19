import 'package:intl/intl.dart';

class DateUtil {
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
}
