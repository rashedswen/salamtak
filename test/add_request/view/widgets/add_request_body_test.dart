// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/add_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AddRequestBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => AddRequestCubit(),
          child: MaterialApp(home: AddRequestBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
