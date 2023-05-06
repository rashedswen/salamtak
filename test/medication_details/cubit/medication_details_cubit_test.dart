// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';

void main() {
  group('MedicationDetailsCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          MedicationDetailsCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final medicationDetailsCubit = MedicationDetailsCubit();
      expect(
          medicationDetailsCubit.state.errorMessage, equals('Default Value'));
    });

    blocTest<MedicationDetailsCubit, MedicationDetailsState>(
      'yourCustomFunction emits nothing',
      build: MedicationDetailsCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <MedicationDetailsState>[],
    );
  });
}
