import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_buyer_flutter/bloc/favorite_bloc.dart';
import 'package:mobile_buyer_flutter/constants.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' show json;

void main() {
  group('Phone Bloc', () {
    late Phone phone;

    setUp(() {
      phone = Phone(
        id: 1,
        name: "name",
        thumbUrl: "thumbUrl",
        price: 11.11,
        rating: 1.0,
        brand: "Samsung",
        description: "Desc",
        isFavorite: true,
      );
    });

    tearDown(() => null);

    test("test favorite stream return empty when no saved data", () async {
      SharedPreferences.setMockInitialValues({});
      final favBloc = FavoriteBloc();
      expectLater(favBloc.phoneStream, emitsInOrder([[]]));

      await Future.delayed(Duration.zero);
      expect(favBloc.phones.isEmpty, true);
    });

    test("test favorite stream return items when there is saved data",
        () async {
      SharedPreferences.setMockInitialValues({
        kPrefKeyFavoriteList: json.encode(<Phone>[phone]).toString(),
      });
      final favBloc = FavoriteBloc();
      expectLater(
          favBloc.phoneStream,
          emitsInOrder([
            [phone]
          ]));

      await Future.delayed(Duration.zero);
      expect(favBloc.phones.isNotEmpty, true);
    });

    test("test add favorite", () async {
      SharedPreferences.setMockInitialValues({});
      final favBloc = FavoriteBloc();
      await Future.delayed(Duration.zero);
      expect(favBloc.phones.isEmpty, true);

      expectLater(
          favBloc.phoneStream,
          emitsInOrder([
            [], // first emit when constructor read and emit
            [phone] // second emit when call toggleFavorite below
          ]));

      favBloc.toggleFavorite(phone);
      await Future.delayed(Duration.zero);

    });

    test("test remove favorite", () async {
      SharedPreferences.setMockInitialValues({});

      final favBloc = FavoriteBloc();

      // force initial and advance time for async
      await Future.delayed(Duration.zero);
      expect(favBloc.phones.isEmpty, true);

      expectLater(
          favBloc.phoneStream,
          emitsInOrder([
            [], // first emit when constructor read and emit
            [phone], // second emit when call toggleFavorite below
            [], // third emit when toggle off
          ]));

      favBloc.toggleFavorite(phone);
      favBloc.toggleFavorite(phone);
      //advance time for async
      await Future.delayed(Duration.zero);

    });
  });
}
