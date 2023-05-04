// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:go_router_sample/main.dart';

void main() {
  testWidgets('Home has button Go to page 2 which moves us to the `page 2`', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text(MyApp.homeText), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Go to page 2'), findsOneWidget);

      // Tap the 'Co to page 2' icon and trigger a frame.
      await tester.tap(find.widgetWithText(ElevatedButton, 'Go to page 2'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Verify that our counter has incremented.
      expect(find.widgetWithText(ElevatedButton, 'Go to page 2'), findsNothing);
      expect(find.text('Page 2'), findsOneWidget);
      expect(find.widgetWithText(ElevatedButton, 'Go Home'), findsOneWidget);
    }
  );
}
