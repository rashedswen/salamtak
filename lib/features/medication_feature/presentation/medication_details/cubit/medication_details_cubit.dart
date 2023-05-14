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
    required MedicationItem medicationItem,
    required MedicationRepository medicationRepository,
  })  : _medicationRepository = medicationRepository,
        super(MedicationDetailsInitial(medicationItem)) {
    _getUsersAcceptedRequest();
  }

  final MedicationRepository _medicationRepository;

  Future<void> _getUsersAcceptedRequest() async {
    emit(
      state.copyWith(
        usersListStatus: MedicationDetailsUserListStatus.loading,
      ),
    );

    try {
      final users =
          await _medicationRepository.getUsersDonatingAndRequestingMedication(
        state.medicationItem.id,
        state.medicationItem.requestType,
      );
      emit(
        state.copyWith(
          usersAcceptedRequest: users,
          usersListStatus: MedicationDetailsUserListStatus.loaded,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          usersListStatus: MedicationDetailsUserListStatus.error,
        ),
      );
    }
  }

  Future<void> acceptMedicatin(SalamtakUser salamtakUser) async {
    final finfIfUserAlreadyAccepted = state.usersAcceptedRequest?.where(
      (element) => element.id == salamtakUser.id,
    );
    if (finfIfUserAlreadyAccepted != null) {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.error,
          errorMessage: 'You already accepted this medication',
        ),
      );
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.initial,
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
        medicationId: state.medicationItem.id,
        user: salamtakUser,
        medicationRequestType: state.medicationItem.requestType,
      );
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.success,
        ),
      );
      await _getUsersAcceptedRequest();
    } on Exception catch (e) {
      emit(
        state.copyWith(
          submitStatus: MedicationDetailsSubmitRequestStatus.error,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
