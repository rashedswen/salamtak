import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/enums/enums.dart';
import '../../../../medication_feature/domain/entity/entities.dart';
import '../../../../medication_feature/domain/repository/medication_repository.dart';
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
      final donations = await _medicationRepository.getMedicationsDontations();
      final requests = await _medicationRepository.getMedicationsRequests();
      final donationsMapped = donations.map((e) => e.toMedicationListItem());
      final requestMapeed = requests.map((e) => e.toMedicationListItem());

      final list = <MedicationItem>[...requestMapeed, ...donationsMapped]
        ..sort((a, b) => b.createdDate.compareTo(a.createdDate))
        ..take(5);
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
