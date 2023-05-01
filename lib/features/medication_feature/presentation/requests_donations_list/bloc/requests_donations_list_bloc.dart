import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
part 'requests_donations_list_event.dart';
part 'requests_donations_list_state.dart';

class RequestsDonationsListBloc
    extends Bloc<RequestsDonationsListEvent, RequestsDonationsListState> {
  RequestsDonationsListBloc(
    MedicationRepository medicationRepository,
  )   : _medicationRepository = medicationRepository,
        super(const RequestsDonationsListInitial()) {
    on<GetListOfMedicationsRequestDonation>(
      _getListOfMedicationsRequestDonation,
    );
  }
  final MedicationRepository _medicationRepository;

  FutureOr<void> _getListOfMedicationsRequestDonation(
    GetListOfMedicationsRequestDonation event,
    Emitter<RequestsDonationsListState> emit,
  ) async {
    final list = <MedicationList>[];
    try {
      final requestsList = await _medicationRepository.getMedicationsRequests();
      final donationsList =
          await _medicationRepository.getMedicationsDontations();
      final mappedRequests = requestsList.map(
        (e) => e.toMedicationListItem(),
      );
      final mappedDonations = donationsList.map(
        (e) => e.toMedicationListItem(),
      );
      list
        ..addAll(mappedRequests)
        ..addAll(mappedDonations);
      emit(
        RequestsDonationsListState(
          medicationsList: list,
          status: RequestsDonationsListStatus.success,
        ),
      );
    } catch (e) {
      emit(
        RequestsDonationsListState(
          medicationsList: list,
          status: RequestsDonationsListStatus.failure,
        ),
      );
    }
  }
}
