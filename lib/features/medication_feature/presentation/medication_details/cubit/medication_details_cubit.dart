import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/entity/users_accepted_requests.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';
import 'package:salamtak/features/user_feature/util/validators.dart';
import 'package:salamtak/util/json/states_and_cities.dart';
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
    final users =
        await _medicationRepository.getUsersDonatingAndRequestingMedication(
      state.medicationItem.id,
      state.medicationItem.requestType,
    );
    emit(
      state.copyWith(
        usersAcceptedRequest: users,
      ),
    );
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
