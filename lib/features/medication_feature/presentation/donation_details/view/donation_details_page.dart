import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/donation_details/widgets/donation_details_body.dart';

/// {@template donation_details_page}
/// A description for DonationDetailsPage
/// {@endtemplate}
class DonationDetailsPage extends StatelessWidget {
  /// {@macro donation_details_page}
  const DonationDetailsPage({super.key});

  /// The static route for DonationDetailsPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DonationDetailsPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DonationDetailsCubit(),
      child: const Scaffold(
        body: DonationDetailsView(),
      ),
    );
  }    
}

/// {@template donation_details_view}
/// Displays the Body of DonationDetailsView
/// {@endtemplate}
class DonationDetailsView extends StatelessWidget {
  /// {@macro donation_details_view}
  const DonationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DonationDetailsBody();
  }
}
