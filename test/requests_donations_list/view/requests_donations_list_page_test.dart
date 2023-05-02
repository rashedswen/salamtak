// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/requests_donations_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RequestsDonationsListPage', () {
    group('route', () {
      test('is routable', () {
        expect(RequestsDonationsListPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RequestsDonationsListView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RequestsDonationsListPage()));
      expect(find.byType(RequestsDonationsListView), findsOneWidget);
    });
  });
}
