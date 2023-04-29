import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/add_donation_body.dart';

/// {@template add_donation_page}
/// A description for AddDonationPage
/// {@endtemplate}
class AddDonationPage extends StatelessWidget {
  /// {@macro add_donation_page}
  const AddDonationPage({super.key});

  /// The static route for AddDonationPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AddDonationPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddDonationCubit(),
      child: const Scaffold(
        body: AddDonationView(),
      ),
    );
  }    
}

/// {@template add_donation_view}
/// Displays the Body of AddDonationView
/// {@endtemplate}
class AddDonationView extends StatelessWidget {
  /// {@macro add_donation_view}
  const AddDonationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AddDonationBody();
  }
}
