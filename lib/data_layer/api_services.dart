import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;

import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class ApiServices {
  final baseUrl = 'https://scb-test-mobile.herokuapp.com/api/mobiles/';

  Future<List<Phone>> fetchPhoneList() async {
    String requestURL = baseUrl;
    http.Response response = await http.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      final jsonObject = json.decode(response.body);
      return jsonObject
          .map<Phone>((json) => Phone.fromJson(json))
          .toList(growable: false);
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }
}