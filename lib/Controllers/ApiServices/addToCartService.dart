import 'dart:convert';

import 'package:salex/Controllers/ApiServices/variables.dart';
import 'package:http/http.dart' as http;

class AddToCartService {
  static Future<bool> addToCart(body) async {

     Map<String, String> requestHeaders = {
       'Content-Type': 'application/json'
     };


    final response =
        await http.post('${URLS.BASE_URL}/phone/addtoCart', body: jsonEncode(body) , headers: requestHeaders);

    var data = response.body;
    // print(body);
    // print(json.decode(data));

    Map<String, dynamic> res_data = jsonDecode(data);
    // log(res_data['loginstatus']);
    if (res_data['message'] == 'success') {
      return true;
    } else {
      return false;
    }
    // return false;
  }
}