import 'dart:convert';
import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:salex/Models/shopModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetMyShopService {
  static Future<List<dynamic>> getShops() async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};
      SharedPreferences authDetail = await SharedPreferences.getInstance();

      final body = {
        "token":authDetail.getString("usertoken")
      };

      final response = await http.post('${URLS.BASE_URL}/shop/getmine',
          body: jsonEncode(body), headers: requestHeaders);

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
