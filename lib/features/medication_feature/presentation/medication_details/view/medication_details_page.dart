import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/widgets/medication_details_body.dart';
import 'package:salamtak/l10n/l10n.dart';

/// {@template medication_details_page}
/// A description for MedicationDetailsPage
/// {@endtemplate}
class MedicationDetailsPage extends StatelessWidget {
  /// {@macro medication_details_page}
  const MedicationDetailsPage({
    super.key,
    this.medicationItem,
    this.medicationId = '',
    this.type = '',
  });

  /// The static route for MedicationDetailsPage
  static Route<dynamic> route(MedicationItem medicationItem) {
    return MaterialPageRoute<dynamic>(
      builder: (_) => MedicationDetailsPage(medicationItem: medicationItem),
    );
  }

  final MedicationItem? medicationItem;
  final String medicationId;
  final String type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MedicationDetailsCubit(
        medicationId: medicationId,
        type: type,
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
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }

        if (state.submitStatus ==
            MedicationDetailsSubmitRequestStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(context.l10n.request_sent_successfully),
              backgroundColor: Colors.green,
            ),
          );
        }
      },
      child: const MedicationDetailsBody(),
    );
  }
}
