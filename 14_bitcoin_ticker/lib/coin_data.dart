import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';

Future<Map<String, String>> getCoinData(String selectedCurrency) async {
  await DotEnv().load('.env');
  String apiKey = DotEnv().env['COIN_API_KEY'];
  Map<String, String> lastPrices = new Map();
  for (String crypto in cryptoList) {
    String requestURL = '$coinAPIURL/$crypto/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      lastPrices[crypto] = lastPrice.toStringAsFixed(2);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
  return lastPrices;
}
