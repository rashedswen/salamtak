import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/cubit/cubit.dart';

/// {@template accept_requests_donations_body}
/// Body of the AcceptRequestsDonationsPage.
///
/// Add what it does
/// {@endtemplate}
class AcceptRequestsDonationsBody extends StatelessWidget {
  /// {@macro accept_requests_donations_body}
  const AcceptRequestsDonationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AcceptRequestsDonationsCubit, AcceptRequestsDonationsState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
