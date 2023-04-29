// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/add_donation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddDonationBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddDonationCubit(),
          child: MaterialApp(home: AddDonationBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
