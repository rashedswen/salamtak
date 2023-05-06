// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/users/users.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersPage', () {
    group('route', () {
      test('is routable', () {
        expect(UsersPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders UsersView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: UsersPage()));
      expect(find.byType(UsersView), findsOneWidget);
    });
  });
}
