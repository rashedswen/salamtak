// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/register/cubit/cubit.dart';

void main() {
  group('RegisterCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          RegisterCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final registerCubit = RegisterCubit();
      expect(registerCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<RegisterCubit, RegisterState>(
      'yourCustomFunction emits nothing',
      build: RegisterCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <RegisterState>[],
    );
  });
}
