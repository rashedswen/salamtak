// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/bloc/bloc.dart';

void main() {
  group('RequestsDonationsListState', () {
    test('supports value equality', () {
      expect(
        RequestsDonationsListState(),
        equals(
          const RequestsDonationsListState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const RequestsDonationsListState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const requestsDonationsListState = RequestsDonationsListState(
            customProperty: 'My property',
          );
          expect(
            requestsDonationsListState.copyWith(),
            equals(requestsDonationsListState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const requestsDonationsListState = RequestsDonationsListState(
            customProperty: 'My property',
          );
          final otherRequestsDonationsListState = RequestsDonationsListState(
            customProperty: 'My property 2',
          );
          expect(requestsDonationsListState, isNot(equals(otherRequestsDonationsListState)));

          expect(
            requestsDonationsListState.copyWith(
              customProperty: otherRequestsDonationsListState.customProperty,
            ),
            equals(otherRequestsDonationsListState),
          );
        },
      );
    });
  });
}
