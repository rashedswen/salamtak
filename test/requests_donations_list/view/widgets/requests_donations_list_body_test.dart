// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/requests_donations_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RequestsDonationsListBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => RequestsDonationsListBloc(),
          child: MaterialApp(home: RequestsDonationsListBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
