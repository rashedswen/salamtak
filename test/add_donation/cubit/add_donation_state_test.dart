// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';

void main() {
  group('AddDonationState', () {
    test('supports value equality', () {
      expect(
        AddDonationState(),
        equals(
          const AddDonationState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddDonationState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addDonationState = AddDonationState(
            customProperty: 'My property',
          );
          expect(
            addDonationState.copyWith(),
            equals(addDonationState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addDonationState = AddDonationState(
            customProperty: 'My property',
          );
          final otherAddDonationState = AddDonationState(
            customProperty: 'My property 2',
          );
          expect(addDonationState, isNot(equals(otherAddDonationState)));

          expect(
            addDonationState.copyWith(
              customProperty: otherAddDonationState.customProperty,
            ),
            equals(otherAddDonationState),
          );
        },
      );
    });
  });
}
