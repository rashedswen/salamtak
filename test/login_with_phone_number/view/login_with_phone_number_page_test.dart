// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/login_with_phone_number.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginWithPhoneNumberPage', () {
    group('route', () {
      test('is routable', () {
        expect(LoginWithPhoneNumberPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders LoginWithPhoneNumberView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: LoginWithPhoneNumberPage()));
      expect(find.byType(LoginWithPhoneNumberView), findsOneWidget);
    });
  });
}
