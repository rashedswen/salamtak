// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';

void main() {
  group('AddDonationCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddDonationCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addDonationCubit = AddDonationCubit();
      expect(addDonationCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddDonationCubit, AddDonationState>(
      'yourCustomFunction emits nothing',
      build: AddDonationCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddDonationState>[],
    );
  });
}
