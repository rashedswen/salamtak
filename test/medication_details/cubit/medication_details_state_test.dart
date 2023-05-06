// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';

void main() {
  group('MedicationDetailsState', () {
    test('supports value equality', () {
      expect(
        MedicationDetailsState(),
        equals(
          const MedicationDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const MedicationDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const medicationDetailsState = MedicationDetailsState(
            errorMessage: 'My property',
          );
          expect(
            medicationDetailsState.copyWith(),
            equals(medicationDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const medicationDetailsState = MedicationDetailsState(
            errorMessage: 'My property',
          );
          final otherMedicationDetailsState = MedicationDetailsState(
            errorMessage: 'My property 2',
          );
          expect(medicationDetailsState,
              isNot(equals(otherMedicationDetailsState)));

          expect(
            medicationDetailsState.copyWith(
              customProperty: otherMedicationDetailsState.errorMessage,
            ),
            equals(otherMedicationDetailsState),
          );
        },
      );
    });
  });
}
