// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/admin_feature/presentation/users/cubit/cubit.dart';

void main() {
  group('UsersCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UsersCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final usersCubit = UsersCubit();
      expect(usersCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<UsersCubit, UsersState>(
      'yourCustomFunction emits nothing',
      build: UsersCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <UsersState>[],
    );
  });
}
