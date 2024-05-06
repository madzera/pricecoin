import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_pt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';
import 'package:intl/intl.dart' as intl;

final class MessageConfig {
  Map<KeyMessage, String> _map = {};

  MessageConfig(BuildContext context) {
    AppLocalizations appLocalizations = _getAppLocalizationsFromLanguage();

    _map = {
      KeyMessage.connectionError : appLocalizations.connectionError,
      KeyMessage.refreshButton : appLocalizations.refreshButton,
      KeyMessage.symbolCoin : appLocalizations.symbolCoin,
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
      case "en": appLocalizations = AppLocalizationsEn(); break;
      case "es": appLocalizations = AppLocalizationsEs(); break;
      case "pt": appLocalizations = AppLocalizationsPt(); break;
      default: appLocalizations = AppLocalizationsEn(); break;
    }

    return appLocalizations;
  }
}

enum KeyMessage {
  connectionError("connectionError"),
  refreshButton("refreshButton"),
  symbolCoin("symbolCoin"),
  search("search"),
  write("write");

  final String _key;

  const KeyMessage(this._key);

  get key => _key;
}