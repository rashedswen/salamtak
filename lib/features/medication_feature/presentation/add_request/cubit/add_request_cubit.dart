import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit(this.medicationRepository)
      : super(
          AddRequestState(
            location: LocationSudan.getSudanCities().first,
          ),
        );

  final MedicationRepository medicationRepository;

  Future<void> nameChanged(String title) async {
    emit(state.copyWith(title: title));
  }

  Future<void> descriptionChanged(String description) async {
    emit(state.copyWith(description: description));
  }

  Future<void> emergencyLevelChanged(EmergencyLevel emergencyLevel) async {
    emit(state.copyWith(emergencyLevel: emergencyLevel));
  }

  Future<void> formChanged(MedicineForm form) async {
    emit(state.copyWith(form: form));
  }

  Future<void> prescriptionChanged(PlatformFile prescription) async {
    emit(state.copyWith(prescription: prescription));
  }

  Future<void> imageChanged(PlatformFile image) async {
    emit(state.copyWith(image: image));
  }

  Future<void> locationChanged(LocationSudan location) async {
    emit(state.copyWith(location: location));
  }

  Future<void> addressChanged(String address) async {
    emit(state.copyWith(address: address));
  }

  Future<void> addRequest() async {
    emit(state.copyWith(status: AddRequestStatus.loading));

    String? image;
    if (state.image != null) {
      if (!kIsWeb) {
        image = state.image?.path;
      }
      image = String?.fromCharCodes(state.image?.bytes ?? []);
    }
    String? prescription;
    if (state.prescription != null) {
      if (!kIsWeb) {
        prescription = state.prescription?.path;
      }
      prescription = String?.fromCharCodes(state.prescription?.bytes ?? []);
    }

    try {
      final request = MedicationRequest(
        form: state.form,
        title: state.title!,
        userId: FirebaseAuth.instance.currentUser?.uid ?? 'unknown',
        description: state.description!,
        emergencyLevel: state.emergencyLevel,
        prescription: prescription,
        image: image,
        location: state.location!.copyWith(
          address: state.address,
        ),
      );
      await medicationRepository.addMedicationRequest(
        request,
        state.image,
        state.prescription,
      );
      emit(
        state.copyWith(
          status: AddRequestStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMassage: e.toString(),
          status: AddRequestStatus.failure,
        ),
      );
    }
  }
}
