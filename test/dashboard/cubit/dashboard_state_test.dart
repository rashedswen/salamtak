// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';

void main() {
  group('DashboardState', () {
    test('supports value equality', () {
      expect(
        DashboardState(),
        equals(
          const DashboardState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const DashboardState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const dashboardState = DashboardState(
            errorMessage: 'My property',
          );
          expect(
            dashboardState.copyWith(),
            equals(dashboardState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const dashboardState = DashboardState(
            errorMessage: 'My property',
          );
          final otherDashboardState = DashboardState(
            errorMessage: 'My property 2',
          );
          expect(dashboardState, isNot(equals(otherDashboardState)));

          expect(
            dashboardState.copyWith(
              customProperty: otherDashboardState.errorMessage,
            ),
            equals(otherDashboardState),
          );
        },
      );
    });
  });
}
