// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/medication_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MedicationDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(MedicationDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders MedicationDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: MedicationDetailsPage()));
      expect(find.byType(MedicationDetailsView), findsOneWidget);
    });
  });
}
