// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/cubit/cubit.dart';

void main() {
  group('LoginWithPhoneNumberState', () {
    test('supports value equality', () {
      expect(
        LoginWithPhoneNumberState(),
        equals(
          const LoginWithPhoneNumberState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const LoginWithPhoneNumberState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const loginWithPhoneNumberState = LoginWithPhoneNumberState(
            phoneNumber: 'My property',
          );
          expect(
            loginWithPhoneNumberState.copyWith(),
            equals(loginWithPhoneNumberState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const loginWithPhoneNumberState = LoginWithPhoneNumberState(
            phoneNumber: 'My property',
          );
          final otherLoginWithPhoneNumberState = LoginWithPhoneNumberState(
            phoneNumber: 'My property 2',
          );
          expect(
            loginWithPhoneNumberState,
            isNot(equals(otherLoginWithPhoneNumberState)),
          );

          expect(
            loginWithPhoneNumberState.copyWith(
              customProperty: otherLoginWithPhoneNumberState.phoneNumber,
            ),
            equals(otherLoginWithPhoneNumberState),
          );
        },
      );
    });
  });
}
