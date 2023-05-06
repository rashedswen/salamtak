// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/bloc/bloc.dart';

void main() {
  group('UserRequestsHistoryEvent', () {  
    group('CustomUserRequestsHistoryEvent', () {
      test('supports value equality', () {
        expect(
          CustomUserRequestsHistoryEvent(),
          equals(const CustomUserRequestsHistoryEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomUserRequestsHistoryEvent(),
          isNotNull
        );
      });
    });
  });
}
