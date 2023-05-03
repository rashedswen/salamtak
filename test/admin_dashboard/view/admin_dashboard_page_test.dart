// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/admin_dashboard/admin_dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminDashboardPage', () {
    group('route', () {
      test('is routable', () {
        expect(AdminDashboardPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders AdminDashboardView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: AdminDashboardPage()));
      expect(find.byType(AdminDashboardView), findsOneWidget);
    });
  });
}
