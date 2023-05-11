import 'package:flutter/material.dart';
import '../../../domain/repository/medication_repository.dart';
import '../cubit/cubit.dart';
import '../widgets/add_donation_body.dart';
import '../../../../../l10n/l10n.dart';

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
      create: (context) =>
          AddDonationCubit(context.read<MedicationRepository>()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.add_donation),
        ),
        body: const AddDonationView(),
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
    return BlocListener<AddDonationCubit, AddDonationState>(
      listener: (context, state) {
        if (state.status == AddDonationStatus.success) {
          Navigator.of(context).pop();
        }
      },
      child: const AddDonationBody(),
    );
  }
}
