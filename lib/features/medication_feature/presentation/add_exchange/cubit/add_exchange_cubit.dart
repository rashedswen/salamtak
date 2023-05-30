import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/enums/medication_form.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_exchange.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

part 'add_exchange_state.dart';

class AddExchangeCubit extends Cubit<AddExchangeState> {
  AddExchangeCubit({
    required MedicationRepository medicationRepository,
  })  : _medicationRepository = medicationRepository,
        super(
          AddExchangeState(
            location: LocationSudan.getSudanCities().first,
          ),
        );

  final MedicationRepository _medicationRepository;

  Future<void> nameChanged(String title) async {
    emit(state.copyWith(medicationName: title));
  }

  Future<void> exchangeMedicineNameChanged(String title) async {
    emit(state.copyWith(exchangeMedicineName: title));
  }

  Future<void> descriptionChanged(String description) async {
    emit(state.copyWith(description: description));
  }

  Future<void> formChanged(MedicineForm form) async {
    emit(state.copyWith(form: form));
  }

  Future<void> emergencyLevelChanged(EmergencyLevel emergency) async {
    emit(state.copyWith(emergencyLevel: emergency));
  }

  Future<void> exchangeMedicineFormChanged(MedicineForm form) async {
    emit(state.copyWith(exchangeMedicineForm: form));
  }

  Future<void> quantityChanged(String quantity) async {
    emit(state.copyWith(quantity: quantity));
  }

  Future<void> expiredAtChanged(DateTime expiredAt) async {
    emit(state.copyWith(expiredAt: expiredAt));
  } 

  Future<void> medicineImageChanged(PlatformFile image) async {
    emit(state.copyWith(medicineImage: image));
  }

  Future<void> exchangeMedicineImageChanged(PlatformFile image) async {
    emit(state.copyWith(exchangeMedicineImage: image));
  }

  Future<void> locationChanged(LocationSudan location) async {
    emit(state.copyWith(location: location));
  }

  Future<void> addressChanged(String address) async {
    emit(state.copyWith(address: address));
  }

  Future<void> addExchange() async {
    emit(state.copyWith(status: AddExchangeStatus.loading));

    final location = state.location?.copyWith(address: state.address);

    final exchange = MedicationExchange(
      medicationName: state.medicationName,
      exchangeMedicationName: state.exchangeMedicineName,
      description: state.description,
      form: state.form,
      exchangeForm: state.exchangeMedicineForm,
      quantity: int.tryParse(state.quantity),
      expiredAt: state.expiredAt?.millisecondsSinceEpoch,
      location: location!,
      userId: FirebaseAuth.instance.currentUser?.uid ?? 'unknown',
    );

    try {
      await _medicationRepository.addMedicationExchange(
        exchange,
        state.medicineImage,
        state.exchangeMedicineImage,
      );
      emit(state.copyWith(status: AddExchangeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddExchangeStatus.error));
    }
  }
}
