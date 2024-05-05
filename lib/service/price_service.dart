import 'package:pricecoin/integration/price_integration.dart';
import 'package:pricecoin/service/country_service.dart';
import 'package:pricecoin/service/util/currency_util.dart';

class PriceService {
  final PriceIntegration _priceIntegration;
  final CountryService _countryService;

  PriceService() :
        _priceIntegration = PriceIntegration(),
        _countryService = CountryService();


  Future<String> bitcoinPrice() async {
    String country = _countryService.getCurrentCountry();
    double price = await _priceIntegration.bitcoinPrice(country);

    String formattedPrice = CurrencyFormatter.parse(price, country: country);

    return formattedPrice;
  }

}