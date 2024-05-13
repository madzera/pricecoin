import 'package:flutter/cupertino.dart';
import 'package:pricecoin/service/price_service.dart';
import '../service/country_service.dart';

class PriceController {
  final PriceService _priceService;
  final CountryService _countryService;

  PriceController(BuildContext context) :
      _priceService = PriceService(),
      _countryService = CountryService();


  Future<String> getBitcoinPrice() async {
    return _priceService.bitcoinPrice().then((value) => value);
  }

  String getSelectedCountry() {
    return _countryService.getCurrentCountry();
  }

  Locale getSelectedLocale() {
    return _countryService.locale;
  }

  String changeCountry(String country) {
    String newCountry = _countryService.changeNewCountry(country);
    return newCountry;
  }

  List<String> countries() {
    return _countryService.supportedCountryCodes();
  }
}