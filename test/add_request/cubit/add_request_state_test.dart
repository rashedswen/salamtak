// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';

void main() {
  group('AddRequestState', () {
    test('supports value equality', () {
      expect(
        AddRequestState(),
        equals(
          const AddRequestState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddRequestState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addRequestState = AddRequestState(
            customProperty: 'My property',
          );
          expect(
            addRequestState.copyWith(),
            equals(addRequestState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addRequestState = AddRequestState(
            customProperty: 'My property',
          );
          final otherAddRequestState = AddRequestState(
            customProperty: 'My property 2',
          );
          expect(addRequestState, isNot(equals(otherAddRequestState)));

          expect(
            addRequestState.copyWith(
              customProperty: otherAddRequestState.customProperty,
            ),
            equals(otherAddRequestState),
          );
        },
      );
    });
  });
}
