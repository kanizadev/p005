// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:p005/main.dart';

void main() {
  testWidgets('Portfolio app initializes without errors', (
    WidgetTester tester,
  ) async {
    // Set a desktop screen size for testing
    await tester.binding.setSurfaceSize(const Size(1920, 1080));

    // Build our app and trigger a frame.
    await tester.pumpWidget(const PortfolioApp());

    // Let the initial animations complete
    await tester.pump();

    // Verify that the app loads and key elements are present
    expect(find.text('<Portfolio />'), findsOneWidget);
    expect(find.text('Kaniza'), findsOneWidget);

    // Clean up
    await tester.binding.setSurfaceSize(null);
  });
}
