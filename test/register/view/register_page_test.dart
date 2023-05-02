// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/register/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterPage', () {
    group('route', () {
      test('is routable', () {
        expect(RegisterPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RegisterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterPage()));
      expect(find.byType(RegisterView), findsOneWidget);
    });
  });
}
