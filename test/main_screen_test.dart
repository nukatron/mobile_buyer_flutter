import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_buyer_flutter/constants.dart';
import 'package:mobile_buyer_flutter/main.dart';

void main() {
  group('Phone Bloc', () {
    testWidgets('Tab should appear', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our tab appear
      expect(find.text('All'), findsOneWidget);
      expect(find.text('Favorite'), findsOneWidget);
    });

    testWidgets('Sort dialog should appear when click "sort" icon',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Tap the 'sort' icon and trigger a dialog.
      await tester.tap(find.byIcon(Icons.sort));
      await tester.pump();

      // Verify that dialog appear
      expect(find.text(kSortByLowestPrice), findsOneWidget);
      expect(find.text(kSortByHighestPrice), findsOneWidget);
      expect(find.text(kSortByRating), findsOneWidget);
    });
  });
}
