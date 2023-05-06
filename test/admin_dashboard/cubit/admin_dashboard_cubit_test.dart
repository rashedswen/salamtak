// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/admin_feature/presentation/admin_dashboard/cubit/cubit.dart';

void main() {
  group('AdminDashboardCubit', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          AdminDashboardCubit(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final adminDashboardCubit = AdminDashboardCubit();
      expect(adminDashboardCubit.state.customProperty, equals('Default Value'));
    });

    blocTest<AdminDashboardCubit, AdminDashboardState>(
      'yourCustomFunction emits nothing',
      build: AdminDashboardCubit.new,
      act: (cubit) => cubit.yourCustomFunction(),
      expect: () => <AdminDashboardState>[],
    );
  });
}
