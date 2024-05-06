import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pricecoin/view/home.dart';
import 'package:intl/intl.dart' as intl;

void main() {
  runApp(const PriceCoin());
}

class PriceCoin extends StatelessWidget {
  const PriceCoin({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PriceCoin',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(intl.Intl.getCurrentLocale()),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


