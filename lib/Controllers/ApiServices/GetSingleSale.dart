import 'dart:convert';
import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:salex/Models/singleSaleModel.dart';
import 'package:http/http.dart' as http;

class GetSingleSaleService {
  static Future<List<dynamic>> getSale(body) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};


      final response = await http.post('${URLS.BASE_URL}/sale/getsinglesales',
          body: jsonEncode(body), headers: requestHeaders);
      // if (response!=null) {
      //   return json.decode(response.body);
      // } else {
      //   return null;
      // }

      // final response = await http.get(url);
      if (response.statusCode == 200) {
        List<SingleSaleItem> list = parseInterests(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<SingleSaleItem> parseInterests(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<SingleSaleItem>((json) => SingleSaleItem.fromJson(json)).toList();
  }
}
