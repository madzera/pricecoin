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
    "CZ":"CZK",
    "DK":"DKK",
    "EU":"EUR",
    "GB":"GBP",
    "HK":"HKD",
    "IN":"INR",
    "JP":"JPY",
    "RU":"RUB",
    "SE":"SEK",
    "TR":"TRY",
    "US":"USD",
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
