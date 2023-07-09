import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:salamtak/core/enums/medication_form.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

part 'add_donation_state.dart';

class AddDonationCubit extends Cubit<AddDonationState> {
  AddDonationCubit(this.medicationRepository)
      : super(
          AddDonationState(
            location: LocationSudan.getSudanCities().first,
          ),
        );

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

  Future<void> locationChanged(LocationSudan location) async {
    emit(state.copyWith(location: location));
  }

  Future<void> addressChanged(String address) async {
    emit(state.copyWith(address: address));
  }

  Future<void> addDonation() async {
    emit(state.copyWith(status: AddDonationStatus.loading));

    final image = imagePath();

    try {
      final donation = MedicationDonation(
        form: state.form,
        title: state.medicationName!,
        userId: FirebaseAuth.instance.currentUser?.uid ?? 'unknown',
        description: state.description ?? '',
        quantity: state.quantity,
        expiredAt: state.expiredAt?.millisecondsSinceEpoch,
        image: image,
        location: state.location!.copyWith(address: state.address),
      );
      await medicationRepository.addMedicationDonation(
        donation,
        state.imageUrl,
      );
      emit(
        state.copyWith(
          status: AddDonationStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMassage: 'fill all fields or check your internet connection',
          status: AddDonationStatus.failure,
        ),
      );
    }
  }

  String? imagePath() {
    String? image;
    if (state.imageUrl != null) {
      if (!kIsWeb) {
        image = state.imageUrl?.path;
      } else {
        image = String?.fromCharCodes(state.imageUrl?.bytes ?? []);
      }
    }
    return image;
  }
}
