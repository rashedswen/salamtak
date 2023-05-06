// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/admin_feature/presentation/users/cubit/cubit.dart';

void main() {
  group('UsersState', () {
    test('supports value equality', () {
      expect(
        UsersState(),
        equals(
          const UsersState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const UsersState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const usersState = UsersState(
            customProperty: 'My property',
          );
          expect(
            usersState.copyWith(),
            equals(usersState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const usersState = UsersState(
            customProperty: 'My property',
          );
          final otherUsersState = UsersState(
            customProperty: 'My property 2',
          );
          expect(usersState, isNot(equals(otherUsersState)));

          expect(
            usersState.copyWith(
              customProperty: otherUsersState.customProperty,
            ),
            equals(otherUsersState),
          );
        },
      );
    });
  });
}
