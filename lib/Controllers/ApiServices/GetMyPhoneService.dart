import 'dart:convert';
import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:salex/Models/phoneModel.dart';
import 'package:http/http.dart' as http;

class GetMyPhoneService {
  static Future<List<dynamic>> getPhones(token) async {
    try {
      Map<String, String> requestHeaders = {'Content-Type': 'application/json'};

      final body = {
        "token":token
      };

      final response = await http.post('${URLS.BASE_URL}/phone/getmine',
          body: jsonEncode(body), headers: requestHeaders);
      // if (response!=null) {
      //   return json.decode(response.body);
      // } else {
      //   return null;
      // }

      // final response = await http.get(url);
      if (response.statusCode == 200) {
        List<PhoneItem> list = parseInterests(response.body);
        return list;
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static List<PhoneItem> parseInterests(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<PhoneItem>((json) => PhoneItem.fromJson(json)).toList();
  }
}
