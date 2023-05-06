// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/bloc/bloc.dart';

void main() {
  group('UserRequestsHistoryState', () {
    test('supports value equality', () {
      expect(
        UserRequestsHistoryState(),
        equals(
          const UserRequestsHistoryState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const UserRequestsHistoryState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const userRequestsHistoryState = UserRequestsHistoryState(
            customProperty: 'My property',
          );
          expect(
            userRequestsHistoryState.copyWith(),
            equals(userRequestsHistoryState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const userRequestsHistoryState = UserRequestsHistoryState(
            customProperty: 'My property',
          );
          final otherUserRequestsHistoryState = UserRequestsHistoryState(
            customProperty: 'My property 2',
          );
          expect(userRequestsHistoryState, isNot(equals(otherUserRequestsHistoryState)));

          expect(
            userRequestsHistoryState.copyWith(
              customProperty: otherUserRequestsHistoryState.customProperty,
            ),
            equals(otherUserRequestsHistoryState),
          );
        },
      );
    });
  });
}
