import 'package:flutter/material.dart';
import 'package:pricecoin/controller/price_controller.dart';

import 'package:pricecoin/service/util/currency_util.dart';
import 'package:pricecoin/service/util/locale_util.dart';

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
      localizationsDelegates: [
        DefaultMaterialLocalizations.delegate,
      ],
      supportedLocales: LocaleUtils.locales,
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
  final PriceController _priceController = PriceController();

  @override
  Widget build(BuildContext context) {
    FutureBuilder futureBuilder = _getFutureBuilder();

    return Scaffold(
     body: Container(
       padding: const EdgeInsets.all(32),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Image.asset("assets/images/bitcoin.png"),
           Padding(
             padding: const EdgeInsets.only(top: 30, bottom: 30),
             child: futureBuilder
           ),
           MaterialButton(
             color: Colors.orange,
             padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
             onPressed: () {
               _retrievePrice(futureBuilder);
             },
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
   );
  }

  void _retrievePrice(FutureBuilder futureBuilder) async {
    setState(() {
      futureBuilder = _getFutureBuilder();
    });
  }

  FutureBuilder _getFutureBuilder() {
    double initialPrice = 0;
    return FutureBuilder(
      future: _priceController.getBitcoinPrice(),
      builder: (context, snapshot) {
        ConnectionState connectionState = snapshot.connectionState;

        String price = '';
        switch (connectionState) {
          case ConnectionState.done: {
            if (snapshot.hasError) {
              price = CurrencyFormatter.parse(initialPrice);
            } else {
              price = snapshot.data;
            }
            break;
          }
          case ConnectionState.active: {
            break;
          }
          case ConnectionState.waiting: {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          case ConnectionState.none: {
            break;
          }
        }

        return Text(
          price,
          style: const TextStyle(fontSize: 35),
        );
      },
    );
  }
}
