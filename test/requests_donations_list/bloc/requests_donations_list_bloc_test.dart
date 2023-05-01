// ignore_for_file: prefer_const_constructors

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/bloc/bloc.dart';

void main() {
  group('RequestsDonationsListBloc', () {
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          RequestsDonationsListBloc(),
          isNotNull,
        );
      });
    });

    test('initial state has default value for customProperty', () {
      final requestsDonationsListBloc = RequestsDonationsListBloc();
      expect(requestsDonationsListBloc.state.customProperty, equals('Default Value'));
    });

    blocTest<RequestsDonationsListBloc, RequestsDonationsListState>(
      'CustomRequestsDonationsListEvent emits nothing',
      build: RequestsDonationsListBloc.new,
      act: (bloc) => bloc.add(const CustomRequestsDonationsListEvent()),
      expect: () => <RequestsDonationsListState>[],
    );
  });
}
