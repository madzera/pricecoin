import 'package:intl/intl.dart';

final class CurrencyFormatter {

  CurrencyFormatter._();


  static String parse(double value) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatCurrency.format(value);
  }
}
