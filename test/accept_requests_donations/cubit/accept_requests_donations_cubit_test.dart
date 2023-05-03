// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/cubit/cubit.dart';

void main() {
  group('AcceptRequestsDonationsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AcceptRequestsDonationsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final acceptRequestsDonationsCubit = AcceptRequestsDonationsCubit();
      expect(acceptRequestsDonationsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AcceptRequestsDonationsCubit, AcceptRequestsDonationsState>(
      'yourCustomFunction emits nothing',
      build: AcceptRequestsDonationsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AcceptRequestsDonationsState>[],
    );
  });
}
