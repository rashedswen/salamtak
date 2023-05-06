// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/cubit/cubit.dart';

void main() {
  group('DonationDetailsState', () {
    test('supports value equality', () {
      expect(
        DonationDetailsState(),
        equals(
          const DonationDetailsState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const DonationDetailsState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const donationDetailsState = DonationDetailsState(
            errorMessage: 'My property',
          );
          expect(
            donationDetailsState.copyWith(),
            equals(donationDetailsState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const donationDetailsState = DonationDetailsState(
            errorMessage: 'My property',
          );
          final otherDonationDetailsState = DonationDetailsState(
            errorMessage: 'My property 2',
          );
          expect(
              donationDetailsState, isNot(equals(otherDonationDetailsState)));

          expect(
            donationDetailsState.copyWith(
              customProperty: otherDonationDetailsState.errorMessage,
            ),
            equals(otherDonationDetailsState),
          );
        },
      );
    });
  });
}
