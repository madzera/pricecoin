import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pricecoin/service/exception/pricecoin_exception.dart';

class PriceIntegration {
  static const String _blockchainURL = "https://blockchain.info/ticker";
  static const String _connectionError = "Não foi possível conectar-se.";
  
  Future<double> bitcoinPrice() async {
    http.Response response = await http.get(Uri.parse(_blockchainURL));

    if (response.statusCode != 200) {
      throw PriceCoinException(_connectionError);
    }
    String body = response.body;
    if (body.isEmpty) {
      throw PriceCoinException(_connectionError);
    }

    Map<String, dynamic> object = json.decode(body);

    return object["BRL"]["buy"];
  }
}