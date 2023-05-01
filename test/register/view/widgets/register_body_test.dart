// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/register/register.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => RegisterCubit(),
          child: MaterialApp(home: RegisterBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
