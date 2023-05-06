// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/donation_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DonationDetailsBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => DonationDetailsCubit(),
          child: MaterialApp(home: DonationDetailsBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
