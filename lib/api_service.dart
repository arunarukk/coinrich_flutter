import 'dart:convert';

import 'package:http/http.dart';

class ApiService {
  String url =
      'https://pro-api.coinmarketcap.com/v1/cryptocurrency/quotes/latest?symbol=BTC,ETH,LTC';

  Map<String, String> get headers => {
        "X-CMC_PRO_API_KEY": "27ab17d1-215f-49e5-9ca4-afd48810c149",
      };

  Future<List<Map<String, dynamic>>> getCoins() async {
    Response response = await get(Uri.parse(url), headers: headers);
    Map<String, dynamic> body = jsonDecode(response.body);
    Map<String, dynamic> newBody = body['data'];

    List<Map<String, dynamic>> coins = [
      newBody['BTC'],
      newBody['ETH'],
      newBody['LTC'],
    ];

    return coins;
  }
}
