// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/cubit/cubit.dart';

void main() {
  group('AcceptRequestsDonationsState', () {
    test('supports value equality', () {
      expect(
        AcceptRequestsDonationsState(),
        equals(
          const AcceptRequestsDonationsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const AcceptRequestsDonationsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const acceptRequestsDonationsState = AcceptRequestsDonationsState(
            customProperty: 'My property',
          );
          expect(
            acceptRequestsDonationsState.copyWith(),
            equals(acceptRequestsDonationsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const acceptRequestsDonationsState = AcceptRequestsDonationsState(
            customProperty: 'My property',
          );
          final otherAcceptRequestsDonationsState = AcceptRequestsDonationsState(
            customProperty: 'My property 2',
          );
          expect(acceptRequestsDonationsState, isNot(equals(otherAcceptRequestsDonationsState)));

          expect(
            acceptRequestsDonationsState.copyWith(
              customProperty: otherAcceptRequestsDonationsState.customProperty,
            ),
            equals(otherAcceptRequestsDonationsState),
          );
        },
      );
    });
  });
}
