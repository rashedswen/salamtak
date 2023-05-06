// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/user_medications_list/user_medications_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('UserMedicationsListBody', () {
    testWidgets('renders Text', (tester) async { 
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => UserMedicationsListCubit(),
          child: MaterialApp(home: UserMedicationsListBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
