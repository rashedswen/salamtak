import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/entity/users_accepted_requests.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';

part 'medication_details_state.dart';

class MedicationDetailsCubit extends Cubit<MedicationDetailsState> {
  MedicationDetailsCubit({
    required MedicationRepository medicationRepository,
    required String medicationId,
    required String type,
    MedicationItem? medicationItem,
  })  : _medicationRepository = medicationRepository,
        super(
          MedicationDetailsInitial(
            medicationId,
            medicationItem: medicationItem,
          ),
        ) {
    if (medicationItem != null) {
      _getUsersAcceptedRequest();
    } else {
      _getMedicationInfo(type);
    }
  }

  final MedicationRepository _medicationRepository;

  Future<void> _getMedicationInfo(String type) async {
    emit(
      state.copyWith(
        medicationInfoStatus: MedicationDetailsMedicationInfoStatus.loading,
      ),
    );
    try {
      MedicationItem medicationInfo;
      if (type == 'donation') {
        final medicationsInfos = await _medicationRepository
            .getMedicationDonation(state.medicationId);
        medicationInfo = medicationsInfos.toModel().toMedicationListItem();
      } else {
        final medicationsInfo = await _medicationRepository
            .getMedicationRequest(state.medicationId);
        medicationInfo = medicationsInfo.toModel().toMedicationListItem();
      }

      emit(
        state.copyWith(
          medicationItem: medicationInfo,
          medicationInfoStatus: MedicationDetailsMedicationInfoStatus.loaded,
        ),
      );
      await _getUsersAcceptedRequest();
    } on Exception {
      emit(
        state.copyWith(
          medicationInfoStatus: MedicationDetailsMedicationInfoStatus.error,
        ),
      );
    }
  }

  Future<void> _getUsersAcceptedRequest() async {
    emit(
      state.copyWith(
        usersListStatus: MedicationDetailsUserListStatus.loading,
      ),
    );

    try {
      final users =
          await _medicationRepository.getUsersDonatingAndRequestingMedication(
        state.medicationItem!.id,
        state.medicationItem!.requestType,
      );
      emit(
        state.copyWith(
          usersAcceptedRequest: users,
          usersListStatus: MedicationDetailsUserListStatus.loaded,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          usersListStatus: MedicationDetailsUserListStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> acceptMedicatin(SalamtakUser salamtakUser) async {
    if (salamtakUser.isEmpty) {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.error,
          errorMessage: 'You need to login first',
        ),
      );
      return;
    }

    final userAlreadyAccepted = state.usersAcceptedRequest?.any(
      (element) => element.id == salamtakUser.id,
    );
    if (userAlreadyAccepted == true) {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.error,
          errorMessage: 'You already accepted this medication',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        submitStatus: MedicationDetailsSubmitRequestStatus.loading,
      ),
    );

    try {
      await _medicationRepository.acceptMedication(
        medicationId: state.medicationItem!.id,
        user: salamtakUser,
        medicationRequestType: state.medicationItem!.requestType,
      );
      await _getUsersAcceptedRequest();
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.error,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.initial,
        ),
      );
    }
  }
}
