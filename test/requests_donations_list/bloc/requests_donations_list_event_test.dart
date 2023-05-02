// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/bloc/bloc.dart';

void main() {
  group('RequestsDonationsListEvent', () {  
    group('CustomRequestsDonationsListEvent', () {
      test('supports value equality', () {
        expect(
          CustomRequestsDonationsListEvent(),
          equals(const CustomRequestsDonationsListEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomRequestsDonationsListEvent(),
          isNotNull
        );
      });
    });
  });
}
