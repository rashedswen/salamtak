import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../domain/entity/medication_list.dart';
import '../../../domain/entity/users_accepted_requests.dart';
import '../../../domain/repository/medication_repository.dart';
import '../../../../user_feature/domain/entity/salamtak_user.dart';
import '../../../../user_feature/util/validators.dart';
import '../../../../../util/json/states_and_cities.dart';
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
        usersListStatus: MedicationDetailsUsersListStatus.loading,
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
          usersListStatus: MedicationDetailsUsersListStatus.loaded,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          usersListStatus: MedicationDetailsUsersListStatus.error,
        ),
      );
    }
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void addressChanged(String value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(
        address: address,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void locationChanged(LocationSudan value) {
    emit(
      state.copyWith(
        location: value,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> acceptMedicatin(SalamtakUser salamtakUser) async {
    await _medicationRepository.acceptMedication(
      medicationId: state.medicationItem.id,
      user: salamtakUser,
      medicationRequestType: state.medicationItem.requestType,
    );
  }
}
