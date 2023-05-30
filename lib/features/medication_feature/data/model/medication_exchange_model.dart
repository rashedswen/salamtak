import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_exchange.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationExchangeModel extends Equatable {
  const MedicationExchangeModel({
    this.id,
    this.medicationImage,
    this.medicationExchangeImage,
    this.createdAt,
    this.updatedAt,
    this.expiredAt,
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

  factory MedicationExchangeModel.fromJson(Map<String, dynamic> map) {
    return MedicationExchangeModel(
      id: map['id'] as String?,
      medicationImage: map['medicationImage'] as String?,
      medicationExchangeImage: map['medicationExchangeImage'] as String?,
      createdAt: map['createdAt'] as int?,
      updatedAt: map['updatedAt'] as int?,
      expiredAt: map['expiredAt'] as int?,
      medicationName: map['medicationName'] as String,
      exchangeMedicationName: map['exchangeMedicationName'] as String,
      description: map['description'] as String,
      form: (map['form'] as String).toMedicineForm,
      exchangeForm: (map['exchangeForm'] as String).toMedicineForm,
      status: (map['status'] as String).toMedicineStatus,
      userId: map['userId'] as String,
      emergencyLevel: (map['emergencyLevel'] as String).toEmergencyLevel,
      location: LocationSudan.fromJson(map['location'] as Map<String, dynamic>),
    );
  }

  // to Json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'medicationImage': medicationImage,
      'medicationExchangeImage': medicationExchangeImage,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'expiredAt': expiredAt,
      'medicationName': medicationName,
      'exchangeMedicationName': exchangeMedicationName,
      'description': description,
      'form': form.toString(),
      'exchangeForm': exchangeForm.toString(),
      'status': status.toString(),
      'userId': userId,
      'emergencyLevel': emergencyLevel.toString(),
      'location': location.toJson(),
    };
  }

  final String? id;
  final String? medicationImage;
  final String? medicationExchangeImage;
  // automaticly set to current date
  final int? createdAt;
  final int? updatedAt;
  final int? expiredAt;
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

  MedicationExchangeModel copyWith({
    String? id,
    String? description,
    String? medicationImage,
    String? medicationExchangeImage,
    int? createdAt,
    int? updatedAt,
    int? expiredAt,
    MedicationStatus? status,
    EmergencyLevel? emergencyLevel,
    MedicineForm? form,
    MedicineForm? exchangeForm,
    String? medicationName,
    String? exchangeMedicationName,
    String? userId,
    LocationSudan? location,
  }) {
    return MedicationExchangeModel(
      id: id ?? this.id,
      description: description ?? this.description,
      medicationImage: medicationImage ?? this.medicationImage,
      medicationExchangeImage:
          medicationExchangeImage ?? this.medicationExchangeImage,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      expiredAt: expiredAt ?? this.expiredAt,
      status: status ?? this.status,
      emergencyLevel: emergencyLevel ?? this.emergencyLevel,
      form: form ?? this.form,
      exchangeForm: exchangeForm ?? this.exchangeForm,
      medicationName: medicationName ?? this.medicationName,
      exchangeMedicationName:
          exchangeMedicationName ?? this.exchangeMedicationName,
      userId: userId ?? this.userId,
      location: location ?? this.location,
    );
  }

  MedicationExchange toEntity() {
    return MedicationExchange(
      id: id,
      createdAt: createdAt,
      description: description,
      emergencyLevel: emergencyLevel,
      exchangeForm: exchangeForm,
      exchangeMedicationName: exchangeMedicationName,
      expiredAt: expiredAt,
      form: form,
      location: location,
      medicationExchangeImage: medicationExchangeImage,
      medicationImage: medicationImage,
      medicationName: medicationName,
      status: status,
      updatedAt: updatedAt,
      userId: userId,
    );
  }

  MedicationItem toMedicationListItem() {
    return MedicationItem(
      id: id!,
      createdDate: DateTime.fromMillisecondsSinceEpoch(createdAt ?? 0),
      description: description,
      name: exchangeMedicationName,
      requestType: MedicationRequestType.donation,
      form: form,
      location: location,
      image: medicationExchangeImage,
      emergencyLevel: EmergencyLevel.low,
      status: status,
      userId: userId,
    );
  }
}
