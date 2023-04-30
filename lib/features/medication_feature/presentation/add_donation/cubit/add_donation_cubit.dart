import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/util/enums/medication_form.dart';
part 'add_donation_state.dart';

class AddDonationCubit extends Cubit<AddDonationState> {
  AddDonationCubit(this.medicationRepository) : super(const AddDonationState());

  final MedicationRepository medicationRepository;

  Future<void> nameChanged(String title) async {
    emit(state.copyWith(medicationName: title));
  }

  Future<void> descriptionChanged(String description) async {
    emit(state.copyWith(description: description));
  }

  Future<void> formChanged(MedicineForm form) async {
    emit(state.copyWith(form: form));
  }

  Future<void> quantityChanged(String quantity) async {
    emit(state.copyWith(quantity: quantity));
  }

  Future<void> expiredAtChanged(DateTime expiredAt) async {
    emit(state.copyWith(expiredAt: expiredAt));
  }

  Future<void> imageChanged(PlatformFile image) async {
    emit(state.copyWith(imageUrl: image));
  }

  Future<void> addDonation() async {
    emit(state.copyWith(status: AddDonationStatus.loading));
    try {
      final donation = MedicationDonation(
        form: state.form,
        title: state.medicationName!,
        userId: 'fefewfwefwefw',
        description: state.description ?? '',
        quantity: state.quantity,
        expiredAt: state.expiredAt?.toIso8601String(),
        image: state.imageUrl,
      );
      await medicationRepository.addMedicationDonation(donation);
      emit(
        state.copyWith(
          status: AddDonationStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMassage: 'fill all fields and check your internet connection',
          status: AddDonationStatus.failure,
        ),
      );
    }
  }
}