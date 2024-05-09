import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_bg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_cs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_da.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_de.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_el.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_et.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_fi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_fr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_hr.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ja.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_lt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_lv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_nl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_pl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_pt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ro.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_ru.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_sk.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_sl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_sv.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_tr.dart';
import 'package:intl/intl.dart' as intl;

final class MessageConfig {
  Map<KeyMessage, String> _map = {};

  MessageConfig(BuildContext context) {
    AppLocalizations appLocalizations = _getAppLocalizationsFromLanguage();

    _map = {
      KeyMessage.connectionError : appLocalizations.connectionError,
      KeyMessage.refreshButton : appLocalizations.refreshButton,
      KeyMessage.search : appLocalizations.search,
      KeyMessage.write : appLocalizations.write,
    };

  }


   String message(final KeyMessage key) {
     String? value = _map[key];
     return value ?? '';
  }

  AppLocalizations _getAppLocalizationsFromLanguage() {
    String locale = intl.Intl.getCurrentLocale();
    String language = locale.split('_')[0];

    final AppLocalizations appLocalizations;
    switch (language) {
      case "bg": appLocalizations = AppLocalizationsBg(); break;
      case "cs": appLocalizations = AppLocalizationsCs(); break;
      case "da": appLocalizations = AppLocalizationsDa(); break;
      case "de": appLocalizations = AppLocalizationsDe(); break;
      case "el": appLocalizations = AppLocalizationsEl(); break;
      case "en": appLocalizations = AppLocalizationsEn(); break;
      case "es": appLocalizations = AppLocalizationsEs(); break;
      case "et": appLocalizations = AppLocalizationsEt(); break;
      case "fi": appLocalizations = AppLocalizationsFi(); break;
      case "fr": appLocalizations = AppLocalizationsFr(); break;
      case "hr": appLocalizations = AppLocalizationsHr(); break;
      case "it": appLocalizations = AppLocalizationsIt(); break;
      case "ja": appLocalizations = AppLocalizationsJa(); break;
      case "lt": appLocalizations = AppLocalizationsLt(); break;
      case "lv": appLocalizations = AppLocalizationsLv(); break;
      case "nl": appLocalizations = AppLocalizationsNl(); break;
      case "pl": appLocalizations = AppLocalizationsPl(); break;
      case "pt": appLocalizations = AppLocalizationsPt(); break;
      case "ro": appLocalizations = AppLocalizationsRo(); break;
      case "ru": appLocalizations = AppLocalizationsRu(); break;
      case "sk": appLocalizations = AppLocalizationsSk(); break;
      case "sl": appLocalizations = AppLocalizationsSl(); break;
      case "sv": appLocalizations = AppLocalizationsSv(); break;
      case "tr": appLocalizations = AppLocalizationsTr(); break;
      default: appLocalizations = AppLocalizationsEn(); break;
    }

    return appLocalizations;
  }
}

enum KeyMessage {
  connectionError("connectionError"),
  refreshButton("refreshButton"),
  search("search"),
  write("write");

  final String _key;

  const KeyMessage(this._key);

  get key => _key;
}