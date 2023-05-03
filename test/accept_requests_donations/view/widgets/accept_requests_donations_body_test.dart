// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/accept_requests_donations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AcceptRequestsDonationsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AcceptRequestsDonationsCubit(),
          child: MaterialApp(home: AcceptRequestsDonationsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
