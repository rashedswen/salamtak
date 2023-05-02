// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/login/cubit/cubit.dart';

void main() {
  group('LoginCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          LoginCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final loginCubit = LoginCubit();
      expect(loginCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<LoginCubit, LoginState>(
      'yourCustomFunction emits nothing',
      build: LoginCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <LoginState>[],
    );
  });
}
