import 'dart:ui';
import 'package:intl/intl.dart';

final class LocaleUtils {
  static String defaultCountryCodeLocale = "US";
  static Locale defaultLocale = Locale(Intl.getCurrentLocale());
  static Map<String, Locale> supportedLocales = {
    "AR" : const Locale("es", "AR"),
    "AU" : const Locale("en", "AU"),
    "BR" : const Locale("pt", "BR"),
    "CA" : const Locale("en", "CA"),
    "CH" : const Locale("gsw", "CH"),
    "CL" : const Locale("es", "CL"),
    "CZ" : const Locale("cs", "CZ"),
    "DK" : const Locale("da", "DK"),
    "EU" : const Locale("en", "EU"),
    "GB" : const Locale("en", "GB"),
    "HK" : const Locale("en", "HK"),
    "IN" : const Locale("en", "IN"),
    "JP" : const Locale("ja", "JP"),
    "RU" : const Locale("ru", "RU"),
    "SE" : const Locale("sv", "SE"),
    "TR" : const Locale("tr", "TR"),
    "US" : const Locale("en", "US"),
  };

  static List<String> supportedCountryCodes() {
    return supportedLocales.keys.toList();
  }

  static String countryCode(Locale locale) {
    String code = locale.countryCode ?? '';
    return code;
  }

  static Locale? getLocaleByCountryCode(String code) {
    return supportedLocales[code];
  }
}

