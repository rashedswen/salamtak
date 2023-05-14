// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/login_with_phone_number.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginWithPhoneNumberBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => LoginWithPhoneNumberCubit(),
          child: MaterialApp(home: LoginWithPhoneNumberBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
