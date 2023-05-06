// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/accept_requests_donations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcceptRequestsDonationsPage', () {
    group('route', () {
      test('is routable', () {
        expect(AcceptRequestsDonationsPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AcceptRequestsDonationsView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AcceptRequestsDonationsPage()));
      expect(find.byType(AcceptRequestsDonationsView), findsOneWidget);
    });
  });
}
