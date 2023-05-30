import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/medication_exchange_model.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationExchange extends Equatable {
  const MedicationExchange({
    this.id,
    this.medicationImage,
    this.medicationExchangeImage,
    this.createdAt,
    this.updatedAt,
    this.expiredAt,
    this.quantity,
    this.status = MedicationStatus.pending,
    this.emergencyLevel = EmergencyLevel.low,
    required this.form,
    required this.exchangeForm,
    required this.medicationName,
    required this.exchangeMedicationName,
    required this.userId,
    required this.description,
    required this.location,
  });

  final String? id;
  final String? medicationImage;
  final String? medicationExchangeImage;
  // automaticly set to current date
  final int? createdAt;
  final int? updatedAt;
  final int? expiredAt;
  final int? quantity;
  final String medicationName;
  final String exchangeMedicationName;
  final String description;
  final MedicineForm form;
  final MedicineForm exchangeForm;
  final MedicationStatus status;
  final String userId;
  final EmergencyLevel emergencyLevel;
  final LocationSudan location;

  @override
  List<Object?> get props => [
        id,
        medicationName,
        exchangeMedicationName,
        description,
        emergencyLevel,
        medicationImage,
        quantity,
        form,
        exchangeForm,
        status,
        medicationExchangeImage,
        createdAt,
        updatedAt,
        expiredAt,
        userId,
        location
      ];

  MedicationExchangeModel toModel() {
    return MedicationExchangeModel(
      id: id,
      medicationName: medicationName,
      exchangeMedicationName: exchangeMedicationName,
      description: description,
      emergencyLevel: emergencyLevel,
      form: form,
      exchangeForm: exchangeForm,
      status: status,
      medicationImage: medicationImage,
      medicationExchangeImage: medicationExchangeImage,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      expiredAt:
          expiredAt ?? DateTime.now().millisecondsSinceEpoch + 2592000000,
      userId: userId,
      location: location,
    );
  }
}
