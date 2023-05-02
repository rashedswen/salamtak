// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/cubit.dart';

void main() {
  group('RegisterState', () {
    test('supports value equality', () {
      expect(
        RegisterState(),
        equals(
          const RegisterState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const RegisterState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const registerState = RegisterState(
            customProperty: 'My property',
          );
          expect(
            registerState.copyWith(),
            equals(registerState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const registerState = RegisterState(
            customProperty: 'My property',
          );
          final otherRegisterState = RegisterState(
            customProperty: 'My property 2',
          );
          expect(registerState, isNot(equals(otherRegisterState)));

          expect(
            registerState.copyWith(
              customProperty: otherRegisterState.customProperty,
            ),
            equals(otherRegisterState),
          );
        },
      );
    });
  });
}
