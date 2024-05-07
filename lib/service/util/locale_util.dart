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
    "GB" : const Locale("en", "GB"),
    "HK" : const Locale("en", "HK"),
    "IN" : const Locale("en", "IN"),
    "JP" : const Locale("ja", "JP"),
    "RU" : const Locale("ru", "RU"),
    "TR" : const Locale("tr", "TR"),
    "US" : const Locale("en", "US"),
//Europe Union countries
    "AT": const Locale("de", "AT"),
    "BE": const Locale("en", "BE"),
    "BG": const Locale("bg", "BG"),
    "HR": const Locale("hr", "HR"),
    "CY": const Locale("en", "CY"),
    "CZ": const Locale("cs", "CZ"),
    "DK": const Locale("da", "DK"),
    "EE": const Locale("et", "EE"),
    "FI": const Locale("fi", "FI"),
    "FR": const Locale("fr", "FR"),
    "DE": const Locale("de", "DE"),
    "GR": const Locale("el", "GR"),
    "HU": const Locale("hu", "HU"),
    "IE": const Locale("en", "IE"),
    "IT": const Locale("it", "IT"),
    "LV": const Locale("lv", "LV"),
    "LT": const Locale("lt", "LT"),
    "LU": const Locale("fr", "LU"),
    "MT": const Locale("en", "MT"),
    "NL": const Locale("nl", "NL"),
    "PL": const Locale("pl", "PL"),
    "PT": const Locale("pt", "PT"),
    "RO": const Locale("ro", "RO"),
    "SK": const Locale("sk", "SK"),
    "SL": const Locale("sl", "SL"),
    "ES": const Locale("es", "ES"),
    "SE": const Locale("sv", "SE")
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

