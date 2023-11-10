import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class CurrencyDataSource {
  Future<Map<String, dynamic>> getCurrencyData(int id) async {
    try {
      Response response = await get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v2/cryptocurrency/info?id=$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'X-CMC_PRO_API_KEY': dotenv.env['API_KEY']!,
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }
  }
}
