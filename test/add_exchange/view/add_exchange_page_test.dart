// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/add_exchange.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddExchangePage', () {
    group('route', () {
      test('is routable', () {
        expect(AddExchangePage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddExchangeView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddExchangePage()));
      expect(find.byType(AddExchangeView), findsOneWidget);
    });
  });
}
