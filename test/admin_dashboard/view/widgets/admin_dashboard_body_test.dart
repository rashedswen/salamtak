// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/admin_dashboard/admin_dashboard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AdminDashboardBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AdminDashboardCubit(),
          child: MaterialApp(home: AdminDashboardBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
