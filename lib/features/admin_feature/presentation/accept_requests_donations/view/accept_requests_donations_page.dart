import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/domain/repository/admin_medication_repository.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/cubit/cubit.dart';
import 'package:salamtak/features/admin_feature/presentation/accept_requests_donations/widgets/accept_requests_donations_body.dart';

/// {@template accept_requests_donations_page}
/// A description for AcceptRequestsDonationsPage
/// {@endtemplate}
class AcceptRequestsDonationsPage extends StatelessWidget {
  /// {@macro accept_requests_donations_page}
  const AcceptRequestsDonationsPage({super.key});

  /// The static route for AcceptRequestsDonationsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const AcceptRequestsDonationsPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AcceptRequestsDonationsCubit(
        adminMedicationRepository: context.read<AdminMedicationRepository>(),
      )..getMedicationDonationsList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Accept Requests Donations'),
          // automaticallyImplyLeading: false,
        ),
        body: const AcceptRequestsDonationsView(),
      ),
    );
  }
}

/// {@template accept_requests_donations_view}
/// Displays the Body of AcceptRequestsDonationsView
/// {@endtemplate}
class AcceptRequestsDonationsView extends StatelessWidget {
  /// {@macro accept_requests_donations_view}
  const AcceptRequestsDonationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AcceptRequestsDonationsBody();
  }
}
