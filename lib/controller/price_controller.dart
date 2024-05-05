import 'package:flutter/cupertino.dart';
import 'package:pricecoin/service/price_service.dart';
import '../service/country_service.dart';
import 'package:pricecoin/config/message_config.dart';

class PriceController {
  static int count = 0;
  final PriceService _priceService;
  final CountryService _countryService;
  final MessageConfig _messageConfig;

  PriceController(BuildContext context) :
      _priceService = PriceService(),
      _countryService = CountryService(),
      _messageConfig = MessageConfig(context) {
    PriceController.count++;
  }


  Future<String> getBitcoinPrice() async {
    return _priceService.bitcoinPrice().then((value) => value)
        .onError((error, stackTrace) {
          return _messageConfig.message(KeyMessage.connectionError);
        });
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