import 'package:flutter/material.dart';
import '../../../domain/entity/medication_list.dart';
import '../../../domain/repository/medication_repository.dart';
import '../cubit/cubit.dart';
import '../widgets/medication_details_body.dart';

/// {@template medication_details_page}
/// A description for MedicationDetailsPage
/// {@endtemplate}
class MedicationDetailsPage extends StatelessWidget {
  /// {@macro medication_details_page}
  const MedicationDetailsPage({super.key, required this.medicationItem});

  /// The static route for MedicationDetailsPage
  static Route<dynamic> route(MedicationItem medicationItem) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicationDetailsPage(medicationItem: medicationItem),
    );
  }

  final MedicationItem medicationItem;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicationDetailsCubit(
        medicationItem: medicationItem,
        medicationRepository: context.read<MedicationRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(medicationItem.name),
        ),
        body: const MedicationDetailsView(),
      ),
    );
  }
}

/// {@template medication_details_view}
/// Displays the Body of MedicationDetailsView
/// {@endtemplate}
class MedicationDetailsView extends StatelessWidget {
  /// {@macro medication_details_view}
  const MedicationDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MedicationDetailsBody();
  }
}
