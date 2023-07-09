import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/domain/entity/entities.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit({
    required MedicationRepository medicationRepository,
  })  : _medicationRepository = medicationRepository,
        super(const DashboardInitial());

  final MedicationRepository _medicationRepository;

  FutureOr<void> getRequestsAndDonations() async {
    emit(const DashboardLoading());
    try {
      // get medications list
      final donations = await _medicationRepository.getMedicationsDontations();
      final requests = await _medicationRepository.getMedicationsRequests();
      // mapped to medication list item[toMedicationListItem]
      final donationsMapped =
          donations.map((e) => e.toMedicationListItem()).toList();
      final requestMapeed =
          requests.map((e) => e.toMedicationListItem()).toList();

      final list = <MedicationItem>[...requestMapeed, ...donationsMapped]
        ..sort((a, b) => b.createdDate.compareTo(a.createdDate));
      // only show approved medications
      final s = list
          .where((element) => element.status == MedicationStatus.approved)
          .toList();
      emit(
        DashboardLoaded(
          medicationItems: s,
        ),
      );
    } catch (e) {
      emit(DashboardError(errorMessage: e.toString()));
    }
  }
}
