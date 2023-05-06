// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/user_requests_history.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserRequestsHistoryBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => UserRequestsHistoryCubit(),
          child: MaterialApp(home: UserRequestsHistoryBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
