import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/cubit/cubit.dart';

/// {@template donation_details_body}
/// Body of the DonationDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class DonationDetailsBody extends StatelessWidget {
  /// {@macro donation_details_body}
  const DonationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DonationDetailsCubit, DonationDetailsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
