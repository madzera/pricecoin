import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pricecoin/view/home.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const PriceCoin());
}

class PriceCoin extends StatelessWidget {
  const PriceCoin({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PriceCoin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(Intl.getCurrentLocale()),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


