import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;

import 'package:mobile_buyer_flutter/data_layer/phone.dart';

class ApiServices {
  final _baseUrl = 'https://scb-test-mobile.herokuapp.com/api/mobiles/';
  final http.Client client;
  ApiServices({required this.client});

  Future<List<Phone>> fetchPhoneList() async {
    String requestURL = _baseUrl;
    http.Response response = await client.get(Uri.parse(requestURL));
    if (response.statusCode == 200) {
      final jsonObject = json.decode(response.body);
      return jsonObject
          .map<Phone>((json) => Phone.fromJson(json))
          .toList(growable: false);
    } else {
      throw Exception('Problem with the get request');
    }
  }
}