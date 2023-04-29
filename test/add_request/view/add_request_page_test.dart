// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/add_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddRequestPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddRequestPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddRequestView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddRequestPage()));
      expect(find.byType(AddRequestView), findsOneWidget);
    });
  });
}
