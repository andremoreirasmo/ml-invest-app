import 'package:intl/intl.dart';

class NumberUtil {
  static String formatedCurrency(double? value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return currencyFormatter.format(value);
  }
}
