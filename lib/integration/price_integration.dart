import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pricecoin/service/exception/pricecoin_exception.dart';

import '../service/util/currency_util.dart';

class PriceIntegration {
  static const String _blockchainURL = "https://blockchain.info/ticker";

  Future<double> bitcoinPrice(String country) async {
    http.Response response = await http.get(Uri.parse(_blockchainURL));

    if (response.statusCode != 200) {
      throw PriceCoinException();
    }
    String body = response.body;
    if (body.isEmpty) {
      throw PriceCoinException();
    }
    Map<String, dynamic> object = json.decode(body);
    String? coin = CurrencyFormatter.toCoin(country: country);

    return object[coin]["buy"];
  }
}