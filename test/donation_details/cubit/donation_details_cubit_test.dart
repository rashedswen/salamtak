// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/cubit/cubit.dart';

void main() {
  group('DonationDetailsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          DonationDetailsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final donationDetailsCubit = DonationDetailsCubit();
      expect(donationDetailsCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<DonationDetailsCubit, DonationDetailsState>(
      'yourCustomFunction emits nothing',
      build: DonationDetailsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <DonationDetailsState>[],
    );
  });
}
