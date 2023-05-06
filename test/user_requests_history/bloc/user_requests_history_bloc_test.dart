// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/bloc/bloc.dart';

void main() {
  group('UserRequestsHistoryBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          UserRequestsHistoryBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final userRequestsHistoryBloc = UserRequestsHistoryBloc();
      expect(userRequestsHistoryBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<UserRequestsHistoryBloc, UserRequestsHistoryState>(
      'CustomUserRequestsHistoryEvent emits nothing',
      build: UserRequestsHistoryBloc.new,
      act: (bloc) => bloc.add(const CustomUserRequestsHistoryEvent()),
      expect: () => <UserRequestsHistoryState>[],
    );
  });
}
