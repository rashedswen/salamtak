// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/add_donation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddDonationPage', () {
    group('route', () {
      test('is routable', () {
        expect(AddDonationPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AddDonationView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AddDonationPage()));
      expect(find.byType(AddDonationView), findsOneWidget);
    });
  });
}
