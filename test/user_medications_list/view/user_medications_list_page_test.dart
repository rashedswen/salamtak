// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/user_medications_list/user_medications_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserMedicationsListPage', () {
    group('route', () {
      test('is routable', () {
        expect(UserMedicationsListPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders UserMedicationsListView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: UserMedicationsListPage()));
      expect(find.byType(UserMedicationsListView), findsOneWidget);
    });
  });
}
