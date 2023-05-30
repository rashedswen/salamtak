// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/cubit/cubit.dart';

void main() {
  group('AddExchangeCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddExchangeCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addExchangeCubit = AddExchangeCubit();
      expect(addExchangeCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddExchangeCubit, AddExchangeState>(
      'yourCustomFunction emits nothing',
      build: AddExchangeCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddExchangeState>[],
    );
  });
}
