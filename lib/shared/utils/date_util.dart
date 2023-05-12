import 'package:intl/intl.dart';

class DateUtil {
  static String formatDateInFull(DateTime date) {
    final formatter = DateFormat('dd \'de\' MMM. \'de\' y');
    return formatter.format(date);
  }
}
