import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class HomePageDataSource {
  Future<Map<String, dynamic>> getHomepageData() async {
    try {
      Response response = await get(
        Uri.parse(
            'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest'),
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
