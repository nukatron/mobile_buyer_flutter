import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('ApiService', ()
  {
    test('returns a phone if the http call completes successfully', () async {
      final client = MockClient((request) async {
        return http.Response("""[{
          "description": "First place in our list",
          "thumbImageURL": "https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg",
          "price": 179.99,
          "rating": 4.9,
          "id": 1,
          "brand": "Samsung",
          "name": "Moto E4 Plus"
          }]""", 200);
      });

      final apiService = ApiServices(client: client);
      final item = await apiService.fetchPhoneList();
      expect(item[0].id, 1);
    });

    test(
        'throws an exception if the http call completes with an error', () async {
      final client = MockClient((request) async {
        return http.Response('Not Found', 404);
      });

      final apiService = ApiServices(client: client);
      try {
        await apiService.fetchPhoneList();
      } catch (e) {
        expect(e, isInstanceOf<Exception>());
      }
    });
  });
}
