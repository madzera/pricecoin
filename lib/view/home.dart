import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import '../config/message_config.dart';
import '../controller/price_controller.dart';
import '../service/util/currency_util.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    final PriceController priceController = PriceController(context);
    final MessageConfig messageConfig = MessageConfig(context);

    FutureBuilder futureBuilder = _getFutureBuilder(priceController);

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
                _retrievePrice(futureBuilder, priceController);
              },
              child: Text(
                messageConfig.message(KeyMessage.refreshButton),
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                onPressed: () {
                  _openCountryPicker(
                    context, futureBuilder, priceController, messageConfig);
                },
                child: Text(
                  _getCountryEmoji(priceController.getSelectedCountry()),
                  style: const TextStyle(
                      fontSize: 40
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _retrievePrice(FutureBuilder futureBuilder, PriceController priceController) async {
    setState(() {
      futureBuilder = _getFutureBuilder(priceController);
    });
  }

  FutureBuilder _getFutureBuilder(PriceController priceController) {
    double initialPrice = 0;
    return FutureBuilder(
      future: priceController.getBitcoinPrice(),
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

  _openCountryPicker(
      BuildContext context,
      FutureBuilder futureBuilder,
      PriceController priceController,
      MessageConfig messageConfig) {
    
    showCountryPicker(
      context: context,
      countryFilter: priceController.countries(),
      onSelect: (Country country) {
        setState(() {
          priceController.changeCountry(country.countryCode);
          _retrievePrice(futureBuilder, priceController);
        });
      },
      // Optional. Sets the theme for the country list picker.
      countryListTheme: CountryListThemeData(
        // Optional. Sets the border radius for the bottomsheet.
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        // Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: messageConfig.message(KeyMessage.search),
          hintText: messageConfig.message(KeyMessage.write),
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withOpacity(0.2),
            ),
          ),
        ),
        // Optional. Styles the text in the search field
        searchTextStyle: const TextStyle(
          color: Colors.blue,
          fontSize: 18,
        ),
      ),
    );
  }

  String _getCountryEmoji(String country) {
    String flag = country.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
            (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

}