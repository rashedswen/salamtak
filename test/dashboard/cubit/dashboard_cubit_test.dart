// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';

void main() {
  group('DashboardCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          DashboardCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final dashboardCubit = DashboardCubit();
      expect(dashboardCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<DashboardCubit, DashboardState>(
      'yourCustomFunction emits nothing',
      build: DashboardCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <DashboardState>[],
    );
  });
}
