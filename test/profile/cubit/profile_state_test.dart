// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';

void main() {
  group('ProfileState', () {
    test('supports value equality', () {
      expect(
        ProfileState(),
        equals(
          const ProfileState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const ProfileState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const profileState = ProfileState(
            email: 'My property',
          );
          expect(
            profileState.copyWith(),
            equals(profileState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const profileState = ProfileState(
            email: 'My property',
          );
          final otherProfileState = ProfileState(
            email: 'My property 2',
          );
          expect(profileState, isNot(equals(otherProfileState)));

          expect(
            profileState.copyWith(
              customProperty: otherProfileState.email,
            ),
            equals(otherProfileState),
          );
        },
      );
    });
  });
}
