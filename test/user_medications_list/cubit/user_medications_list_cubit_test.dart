// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_medications_list/cubit/cubit.dart';

void main() {
  group('UserMedicationsListCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UserMedicationsListCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final userMedicationsListCubit = UserMedicationsListCubit();
      expect(userMedicationsListCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<UserMedicationsListCubit, UserMedicationsListState>(
      'yourCustomFunction emits nothing',
      build: UserMedicationsListCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <UserMedicationsListState>[],
    );
  });
}
