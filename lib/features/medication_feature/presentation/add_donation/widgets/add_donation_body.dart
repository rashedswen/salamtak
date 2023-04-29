import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';

/// {@template add_donation_body}
/// Body of the AddDonationPage.
///
/// Add what it does
/// {@endtemplate}
class AddDonationBody extends StatelessWidget {
  /// {@macro add_donation_body}
  const AddDonationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDonationCubit, AddDonationState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
