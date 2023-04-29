import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';
part 'add_request_state.dart';

class AddRequestCubit extends Cubit<AddRequestState> {
  AddRequestCubit(this.medicationRepository) : super(const AddRequestState());

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

  Future<void> addRequest() async {
    emit(state.copyWith(status: AddRequestStatus.loading));
    try {
      final request = MedicationRequest(
        form: state.form,
        title: state.title!,
        userId: 'fefewfwefwefw',
        description: state.description!,
        emergencyLevel: state.emergencyLevel,
        prescription: state.prescription,
      );
      await medicationRepository.addMedicationRequest(request);
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
