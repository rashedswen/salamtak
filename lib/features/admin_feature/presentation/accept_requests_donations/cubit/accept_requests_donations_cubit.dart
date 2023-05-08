import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/admin_feature/domain/entity/entities.dart';
import 'package:salamtak/features/admin_feature/domain/repository/admin_medication_repository.dart';
part 'accept_requests_donations_state.dart';

class AcceptRequestsDonationsCubit extends Cubit<AcceptRequestsDonationsState> {
  AcceptRequestsDonationsCubit({
    required AdminMedicationRepository adminMedicationRepository,
  })  : _adminMedicationRepository = adminMedicationRepository,
        super(const AcceptRequestsDonationsInitial());

  final AdminMedicationRepository _adminMedicationRepository;

  Future<void> getMedicationDonationsList() async {
    emit(const AcceptRequestsDonationsLoading());
    try {
      final medicationList =
          await _adminMedicationRepository.getMedicationsRequestsAndDonations();

      final list = medicationList
          .where((element) => element.status != MedicationStatus.approved)
          .toList();
      emit(AcceptRequestsDonationsLoaded(medicationList));
    } catch (e) {
      emit(AcceptRequestsDonationsError(e.toString()));
    }
  }

  Future<void> changeMedicationStatus(
    AdminMedicationList medication,
    MedicationStatus status,
    String? rejectedReason,
  ) async {
    emit(const AcceptRequestsDonationsLoading());
    try {
      if (medication.requestType == MedicationRequestType.donation) {
        await _adminMedicationRepository.changeDonationStatus(
          medication.id,
          status,
          rejectedReason,
        );
      }
      if (medication.requestType == MedicationRequestType.request) {
        await _adminMedicationRepository.changeRequestStatus(
          medication.id,
          status,
          rejectedReason,
        );
      }
      await getMedicationDonationsList();
    } catch (e) {
      emit(AcceptRequestsDonationsError(e.toString()));
    }
  }

  // rejectMedication
  Future<void> rejectMedication(
    AdminMedicationList medication,
    String rejectedReason,
  ) async {
    emit(const AcceptRequestsDonationsLoading());
    try {
      if (medication.requestType == MedicationRequestType.donation) {
        await _adminMedicationRepository.changeDonationStatus(
          medication.id,
          MedicationStatus.rejected,
          rejectedReason,
        );
      }
      if (medication.requestType == MedicationRequestType.request) {
        await _adminMedicationRepository.changeRequestStatus(
          medication.id,
          MedicationStatus.rejected,
          rejectedReason,
        );
      }
      await getMedicationDonationsList();
    } catch (e) {
      emit(AcceptRequestsDonationsError(e.toString()));
    }
  }

  // acceptMedication
  Future<void> acceptMedication(
    AdminMedicationList medication,
  ) async {
    emit(const AcceptRequestsDonationsLoading());
    try {
      if (medication.requestType == MedicationRequestType.donation) {
        await _adminMedicationRepository.changeDonationStatus(
          medication.id,
          MedicationStatus.approved,
          null,
        );
      }
      if (medication.requestType == MedicationRequestType.request) {
        await _adminMedicationRepository.changeRequestStatus(
          medication.id,
          MedicationStatus.approved,
          null,
        );
      }
      await getMedicationDonationsList();
    } catch (e) {
      emit(AcceptRequestsDonationsError(e.toString()));
    }
  }
}
