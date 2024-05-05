import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final class MessageConfig {
  final Map<KeyMessage, String> _map;

  MessageConfig(BuildContext context) : _map = {
    KeyMessage.connectionError : AppLocalizations.of(context)!.connectionError,
    KeyMessage.refreshButton : AppLocalizations.of(context)!.refreshButton,
    KeyMessage.symbolCoin : AppLocalizations.of(context)!.symbolCoin,
    KeyMessage.search : AppLocalizations.of(context)!.search,
    KeyMessage.write : AppLocalizations.of(context)!.write,
  };


   String message(final KeyMessage key) {
     String? value = _map[key];
     return value ?? '';
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