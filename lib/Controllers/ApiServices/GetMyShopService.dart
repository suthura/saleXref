import 'dart:convert';
import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:salex/Models/shopModel.dart';
import 'package:http/http.dart' as http;

class GetMyShopService {
  static Future<List<dynamic>> getShops() async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

      final body = {
        "token":
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZTRlMzNlNTEyZTgyYjAwMTdkYTZjMDQiLCJpYXQiOjE1ODI4MDgwODJ9.wWJAxrBnXQC_W5DmOVQKZnZD6gA6ejUkXgbLHhPjbmQ"
      };

      final response = await http.post('${URLS.BASE_URL}/shop/getmine',
          body: jsonEncode(body), headers: requestHeaders);
      // if (response!=null) {
      //   return json.decode(response.body);
      // } else {
      //   return null;
      // }

      // final response = await http.get(url);
      if (response.statusCode == 200) {
        List<ShopItem> list = parseInterests(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<ShopItem> parseInterests(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<ShopItem>((json) => ShopItem.fromJson(json)).toList();
  }
}
