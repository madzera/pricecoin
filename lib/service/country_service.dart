import 'dart:ui';
import 'package:pricecoin/service/util/locale_util.dart';
import 'package:intl/intl.dart';

class CountryService {
  static Locale _locale = LocaleUtils.defaultLocale;

  get locale => _locale;

  String getCurrentCountry() {
    return _locale.toString().split("_")[1];
  }

  Locale changeNewLocale(Locale locale) {
    List<Locale> supportedLocales = LocaleUtils.supportedLocales.values.toList();

    if (supportedLocales.contains(locale)) {
      _locale = locale;
    } else {
      _locale =  LocaleUtils.defaultLocale;
    }

    Intl.defaultLocale = _locale.toString();
    return _locale;
  }

  Locale changeNewLocaleByCountryCode(String countryCode) {
    Locale? selectedLocale = LocaleUtils.getLocaleByCountryCode(countryCode);

    _locale = selectedLocale ?? LocaleUtils.defaultLocale;
    Intl.defaultLocale = _locale.toString();

    return _locale;
  }

  String changeNewCountry(String countryCode) {
    Locale? selectedLocale = LocaleUtils.getLocaleByCountryCode(countryCode);

    String newCountry = LocaleUtils.defaultCountryCodeLocale;
    if (selectedLocale != null) {
      _locale = selectedLocale;
      Intl.defaultLocale = _locale.toString();

      newCountry = selectedLocale.countryCode ?? LocaleUtils.defaultCountryCodeLocale;
    }

    return newCountry;
  }

  List<String> supportedCountryCodes() {
    return LocaleUtils.supportedLocales.keys.toList();
  }
}