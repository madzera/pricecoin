import 'package:pricecoin/integration/price_integration.dart';
import 'package:pricecoin/service/util/currency_util.dart';

class PriceService {
  final PriceIntegration _priceIntegration;

  PriceService() : _priceIntegration = PriceIntegration();

  Future<String> bitcoinPrice() async {
    double price = await _priceIntegration.bitcoinPrice();
    String formattedPrice = CurrencyFormatter.parse(price);

    return formattedPrice;
  }
}