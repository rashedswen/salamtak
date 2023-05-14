import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/widgets/medication_details_body.dart';

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
      child: const Scaffold(
        drawer: SalamtakDrawer(),
        body: MedicationDetailsView(),
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
    return BlocListener<MedicationDetailsCubit, MedicationDetailsState>(
      listener: (context, state) {
        if (state.submitStatus == MedicationDetailsSubmitRequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Error'), backgroundColor: Colors.red),
          );
        }
      },
      child: const MedicationDetailsBody(),
    );
  }
}
