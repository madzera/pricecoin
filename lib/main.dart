import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pricecoin/service/util/currency_formatter.dart';

void main() {
  runApp(const PriceCoin());
}

class PriceCoin extends StatelessWidget {
  const PriceCoin({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PriceCoin',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const String _endpoint = "https://blockchain.info/ticker";
  String _price = "0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/bitcoin.png"),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  _price,
                  style: const TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              MaterialButton(
                color: Colors.orange,
                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _retrievePrice,
                child: const Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _retrievePrice() async {
    http.Response response = await http.get(Uri.parse(_endpoint));
    Map<String, dynamic> result = json.decode(response.body);
    double value = result["BRL"]["buy"];

    setState(() {
      _price = CurrencyFormatter.parse(value);
    });
  }
}
