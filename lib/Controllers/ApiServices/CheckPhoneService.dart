import 'dart:convert';

import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:http/http.dart' as http;

class CheckPhoneService {
  static Future<String> CheckPhone(body) async {

     Map<String, String> requestHeaders = {
       'Content-Type': 'application/json'
     };


    final response =
        await http.post('${URLS.BASE_URL}/user/checkphonenumber', body: jsonEncode(body) , headers: requestHeaders);

    var data = response.body;
    // print(body);
    print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);
    print(res_data.toString());
    if (res_data['token'] !=null) {
      return res_data['token'];
    } else {
      return "invalid";
    }
    // return false;
  }
}