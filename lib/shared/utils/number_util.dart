import 'package:intl/intl.dart';

class NumberUtil {
  static String formatCurrency(num? value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
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

    if (value == null) {
      return '0,00';
    }

    return currencyFormatter.format(value);
  }

  static String formatInt(num? value) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: '',
      decimalDigits: 0,
    );

    return currencyFormatter.format(value);
  }
}
