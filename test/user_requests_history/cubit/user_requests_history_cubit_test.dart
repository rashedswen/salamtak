// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/cubit/cubit.dart';

void main() {
  group('UserRequestsHistoryCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UserRequestsHistoryCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final userRequestsHistoryCubit = UserRequestsHistoryCubit();
      expect(
          userRequestsHistoryCubit.state.errorMessage, equals('Default Value'));
    });

    blocTest<UserRequestsHistoryCubit, UserRequestsHistoryState>(
      'yourCustomFunction emits nothing',
      build: UserRequestsHistoryCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <UserRequestsHistoryState>[],
    );
  });
}
