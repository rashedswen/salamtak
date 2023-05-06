// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/user_requests_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRequestsHistoryPage', () {
    group('route', () {
      test('is routable', () {
        expect(UserRequestsHistoryPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders UserRequestsHistoryView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: UserRequestsHistoryPage()));
      expect(find.byType(UserRequestsHistoryView), findsOneWidget);
    });
  });
}
