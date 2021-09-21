import 'package:flutter_test/flutter_test.dart';
import 'package:http/testing.dart';
import 'dart:convert' show json;

import 'package:mobile_buyer_flutter/data_layer/phone.dart';

void main() {
  group('Phone Object', () {
    test("test parse object from json", () {
      final jsonObject = json.decode("""{
          "description": "First place in our list",
          "thumbImageURL": "https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg",
          "price": 179.99,
          "rating": 4.9,
          "id": 1,
          "brand": "Samsung",
          "name": "Moto E4 Plus"
          }""");
      final phone = Phone.fromJson(jsonObject);
      expect(phone.id, 1);
      expect(phone.description, "First place in our list");
      expect(phone.thumbUrl,
          "https://cdn.mos.cms.futurecdn.net/grwJkAGWQp4EPpWA3ys3YC-650-80.jpg");
      expect(phone.price, 179.99);
      expect(phone.rating, 4.9);
      expect(phone.brand, "Samsung");
      expect(phone.name, "Moto E4 Plus");
      expect(phone.isFavorite, false);
    });

    test("test show display price", () {
      final phone = Phone(
          id: 1, name: "name", thumbUrl: "thumbUrl", price: 124.1231, rating: 1.0);
      expect(phone.priceDisplay, '\$124.12');
    });

    test("test operation equals which is compare by id", () {
      final phone = Phone(
          id: 1, name: "name", thumbUrl: "thumbUrl", price: 124.1231, rating: 1.0);
      final phone2 = Phone(
          id: 1, name: "name2", thumbUrl: "thumbUrl2", price: 11.12, rating: 2.0);
      expect(phone == phone2, true);
    });
  });
}
