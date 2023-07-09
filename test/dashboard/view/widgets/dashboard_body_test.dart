// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/dashboard.dart';

void main() {
  group('DashboardBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => DashboardCubit(),
          child: MaterialApp(home: DashboardBodyMobile()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
