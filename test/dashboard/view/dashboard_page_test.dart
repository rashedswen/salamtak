// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DashboardPage', () {
    group('route', () {
      test('is routable', () {
        expect(DashboardPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders DashboardView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: DashboardPage()));
      expect(find.byType(DashboardView), findsOneWidget);
    });
  });
}
