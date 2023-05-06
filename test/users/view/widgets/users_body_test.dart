// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/users/users.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UsersBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => UsersCubit(),
          child: MaterialApp(home: UsersBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
