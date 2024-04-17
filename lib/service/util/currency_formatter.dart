import 'package:intl/intl.dart';

final class CurrencyFormatter {

  static String parse(double value) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatCurrency.format(value);
  }
}
