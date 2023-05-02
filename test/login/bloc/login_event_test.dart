// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/user_feature/presentation/login/bloc/bloc.dart';

void main() {
  group('LoginEvent', () {  
    group('CustomLoginEvent', () {
      test('supports value equality', () {
        expect(
          CustomLoginEvent(),
          equals(const CustomLoginEvent()),
        );
      });
    });
    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const CustomLoginEvent(),
          isNotNull
        );
      });
    });
  });
}
