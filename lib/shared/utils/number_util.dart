import 'package:intl/intl.dart';

class NumberUtil {
  static String formatCurrency(num? value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '\$',
      decimalDigits: 2,
    );

    return currencyFormatter.format(value);
  }

  static String formatValue(num? value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 2,
    );

    return currencyFormatter.format(value);
  }
}
