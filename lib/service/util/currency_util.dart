import 'package:intl/intl.dart';
import 'package:pricecoin/service/util/locale_util.dart';

final class CurrencyFormatter {
  static Map<String, String> mapCountryCoin = {
    "AR":"ARS",
    "AU":"AUD",
    "BR":"BRL",
    "CA":"CAD",
    "CH":"CHF",
    "CL":"CLP",
    "EU":"EUR",
    "GB":"GBP",
    "HK":"HKD",
    "IN":"INR",
    "JP":"JPY",
    "RU":"RUB",
    "TR":"TRY",
    "US":"USD",
//Europe Union countries
    "AT": "EUR",
    "BE": "EUR",
    "BG": "EUR",
    "HR": "EUR",
    "CY": "EUR",
    "CZ": "EUR",
    "DK": "EUR",
    "EE": "EUR",
    "FI": "EUR",
    "FR": "EUR",
    "DE": "EUR",
    "GR": "EUR",
    "HU": "EUR",
    "IE": "EUR",
    "IT": "EUR",
    "LV": "EUR",
    "LT": "EUR",
    "LU": "EUR",
    "MT": "EUR",
    "NL": "EUR",
    "PL": "EUR",
    "PT": "EUR",
    "RO": "EUR",
    "SK": "EUR",
    "SL": "EUR",
    "ES": "EUR",
    "SE": "EUR"
  };

  CurrencyFormatter._();


  static String parse(double value, {String? country}) {
    String countryCode = country ?? '';
    String coin = toCoin(country: countryCode);
    NumberFormat formatCurrency = NumberFormat.simpleCurrency(name: coin);
    return formatCurrency.format(value);
  }

  static String toCoin({required String country}) {
    return mapCountryCoin[country] ?? LocaleUtils.defaultCountryCodeLocale;
  }
}
