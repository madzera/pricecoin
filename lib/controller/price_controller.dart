import 'package:pricecoin/service/price_service.dart';

class PriceController {
  final PriceService _priceService;

  PriceController() : _priceService = PriceService();


  Future<String> getBitcoinPrice() async {
    return _priceService.bitcoinPrice().then((value) => value)
        .onError((error, stackTrace) => error.toString());
  }
}