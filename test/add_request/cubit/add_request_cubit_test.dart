// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';

void main() {
  group('AddRequestCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AddRequestCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final addRequestCubit = AddRequestCubit();
      expect(addRequestCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AddRequestCubit, AddRequestState>(
      'yourCustomFunction emits nothing',
      build: AddRequestCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AddRequestState>[],
    );
  });
}
