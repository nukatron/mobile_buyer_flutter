import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_buyer_flutter/bloc/phone_bloc.dart';
import 'package:mobile_buyer_flutter/data_layer/api_services.dart';
import 'package:mobile_buyer_flutter/data_layer/phone.dart';
import 'package:mobile_buyer_flutter/data_layer/sort_type.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'phone_bloc_test.mocks.dart';

@GenerateMocks([ApiServices])
void main() {
  group('Phone Bloc', () {
    late MockApiServices mockApiService;
    late Phone phone1;
    late Phone phone2;

    setUp(() => {
          mockApiService = MockApiServices(),
          phone1 = Phone(
              id: 1,
              name: "name",
              thumbUrl: "thumbUrl",
              price: 11.11,
              rating: 1.0),
          phone2 = Phone(
              id: 2,
              name: "name",
              thumbUrl: "thumbUrl",
              price: 22.22,
              rating: 2.0),
        });

    tearDown(() => null);

    test("test phone bloc return items", () async {
      when(mockApiService.fetchPhoneList())
          .thenAnswer((_) async => <Phone>[phone1, phone2]);

      final phoneBloc = PhoneBloc(mockApiService);
      expectLater(
          phoneBloc.phoneStream,
          emitsInOrder([
            [phone1, phone2]
          ]));

      await Future.delayed(Duration.zero);
      expect(phoneBloc.phones.isNotEmpty, true);
    });

    test('throws an exception if the http call completes with an error', () {
      final exception = Exception('Problem with the get request');
      when(mockApiService.fetchPhoneList()).thenAnswer(
        (_) async => throw exception,
      );
      final phoneBloc = PhoneBloc(mockApiService);
      expect(phoneBloc.phoneStream, emitsError(exception));
    });

    test("test toggle update", () async {
      when(mockApiService.fetchPhoneList())
          .thenAnswer((_) async => <Phone>[phone1]);

      final phoneBloc = PhoneBloc(mockApiService);
      //for remove delay from 'async' when constructor call fetchPhones
      await Future.delayed(Duration.zero);

      // set/subscribe here to expect 2 emits happened
      // since we use BehaviorSubject so it will keep the above value.
      // It will emit as soon as when it's subscribed.
      expectLater(
          phoneBloc.phoneStream,
          emitsInOrder([
            [phone1],
            [phone1]
          ]));

      // force emit the second time
      phoneBloc.toggleUpdate();
      //for remove delay from 'async' when toggleUpdate call emit
      await Future.delayed(Duration.zero);
    });

    test("test sort by rating", () async {
      when(mockApiService.fetchPhoneList())
          .thenAnswer((_) async => <Phone>[phone1, phone2]);

      final phoneBloc = PhoneBloc(mockApiService);
      await Future.delayed(Duration.zero);

      expectLater(
          phoneBloc.phoneStream,
          emitsInOrder([
            [phone1, phone2], //first emit, non sorting
            [phone2, phone1], //second emit, after sorting
          ]));

      phoneBloc.updateSortedList(SortType.rating);
      await Future.delayed(Duration.zero);
    });

    test("test sort by price low to high", () async {
      when(mockApiService.fetchPhoneList())
          .thenAnswer((_) async => <Phone>[phone2, phone1]);

      final phoneBloc = PhoneBloc(mockApiService);
      await Future.delayed(Duration.zero);

      expectLater(
          phoneBloc.phoneStream,
          emitsInOrder([
            [phone2, phone1], //first emit, non sorting
            [phone1, phone2], //second emit, after sorting
          ]));

      phoneBloc.updateSortedList(SortType.lowestPrice);
      await Future.delayed(Duration.zero);
    });

    test("test sort by price high to low", () async {
      when(mockApiService.fetchPhoneList())
          .thenAnswer((_) async => <Phone>[phone1, phone2]);

      final phoneBloc = PhoneBloc(mockApiService);
      await Future.delayed(Duration.zero);

      expectLater(
          phoneBloc.phoneStream,
          emitsInOrder([
            [phone1, phone2], //first emit, non sorting
            [phone2, phone1], //second emit, after sorting
          ]));

      phoneBloc.updateSortedList(SortType.highestPrice);
      await Future.delayed(Duration.zero);
    });
  });
}
