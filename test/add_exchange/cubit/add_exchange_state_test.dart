// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/cubit/cubit.dart';

void main() {
  group('AddExchangeState', () {
    test('supports value equality', () {
      expect(
        AddExchangeState(),
        equals(
          const AddExchangeState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AddExchangeState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const addExchangeState = AddExchangeState(
            customProperty: 'My property',
          );
          expect(
            addExchangeState.copyWith(),
            equals(addExchangeState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const addExchangeState = AddExchangeState(
            customProperty: 'My property',
          );
          final otherAddExchangeState = AddExchangeState(
            customProperty: 'My property 2',
          );
          expect(addExchangeState, isNot(equals(otherAddExchangeState)));

          expect(
            addExchangeState.copyWith(
              customProperty: otherAddExchangeState.customProperty,
            ),
            equals(otherAddExchangeState),
          );
        },
      );
    });
  });
}
