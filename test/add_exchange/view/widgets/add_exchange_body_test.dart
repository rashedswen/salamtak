// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/add_exchange.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddExchangeBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddExchangeCubit(),
          child: MaterialApp(home: AddExchangeBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
