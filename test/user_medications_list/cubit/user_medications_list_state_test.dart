// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_medications_list/cubit/cubit.dart';

void main() {
  group('UserMedicationsListState', () {
    test('supports value equality', () {
      expect(
        UserMedicationsListState(),
        equals(
          const UserMedicationsListState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const UserMedicationsListState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const userMedicationsListState = UserMedicationsListState(
            customProperty: 'My property',
          );
          expect(
            userMedicationsListState.copyWith(),
            equals(userMedicationsListState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const userMedicationsListState = UserMedicationsListState(
            customProperty: 'My property',
          );
          final otherUserMedicationsListState = UserMedicationsListState(
            customProperty: 'My property 2',
          );
          expect(userMedicationsListState, isNot(equals(otherUserMedicationsListState)));

          expect(
            userMedicationsListState.copyWith(
              customProperty: otherUserMedicationsListState.customProperty,
            ),
            equals(otherUserMedicationsListState),
          );
        },
      );
    });
  });
}
