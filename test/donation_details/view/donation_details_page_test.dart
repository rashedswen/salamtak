// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/donation_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DonationDetailsPage', () {
    group('route', () {
      test('is routable', () {
        expect(DonationDetailsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders DonationDetailsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DonationDetailsPage()));
      expect(find.byType(DonationDetailsView), findsOneWidget);
    });
  });
}
