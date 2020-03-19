import 'dart:convert';

import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:http/http.dart' as http;

class ChangeAvailabilityService {
  static Future<bool> changeAvailability(body) async {

     Map<String, String> requestHeaders = {
       'Content-Type': 'application/json'
     };


    final response =
        await http.post('${URLS.BASE_URL}/phone/updateavailability', body: jsonEncode(body) , headers: requestHeaders);

    var data = response.body;
    // print(body);
    print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);
    print(res_data.toString());
    if (res_data['message'] == 'success') {
      return true;
    } else {
      return false;
    }
    // return false;
  }
}