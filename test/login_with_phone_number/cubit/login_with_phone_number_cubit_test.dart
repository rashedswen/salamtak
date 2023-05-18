// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/login_with_phone_number/cubit/cubit.dart';

void main() {
  group('LoginWithPhoneNumberCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LoginWithPhoneNumberCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final loginWithPhoneNumberCubit = LoginWithPhoneNumberCubit();
      expect(
          loginWithPhoneNumberCubit.state.phoneNumber, equals('Default Value'));
    });

    blocTest<LoginWithPhoneNumberCubit, LoginWithPhoneNumberState>(
      'yourCustomFunction emits nothing',
      build: LoginWithPhoneNumberCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <LoginWithPhoneNumberState>[],
    );
  });
}
