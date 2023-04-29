import 'package:file_picker/file_picker.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';

class MedicationRequestModel {
  factory MedicationRequestModel.fromJson(Map<String, dynamic> map) {
    return MedicationRequestModel(
      id: map['id'] as String?,
      image: map['image'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      prescription: map['prescription'] as PlatformFile?,
      title: map['title'] as String,
      description: map['description'] as String,
      form: (map['form'] as String).toMedicineForm,
      status: (map['status'] as String).toMedicineStatus,
      userId: map['userId'] as String,
      emergencyLevel: (map['emergencyLevel'] as String).toEmergencyLevel,
    );
  }
  const MedicationRequestModel({
    this.id,
    this.image,
    this.prescription,
    this.createdAt,
    this.updatedAt,
    this.status = MedicationStatus.pending,
    this.emergencyLevel = EmergencyLevel.low,
    required this.form,
    required this.title,
    required this.userId,
    required this.description,
  });

  final String? id;
  final String? image;
  // automaticly set to current date
  final String? createdAt;
  final String? updatedAt;
  final PlatformFile? prescription;
  final String title;
  final String description;
  final MedicineForm form;
  final MedicationStatus status;
  final String userId;
  final EmergencyLevel emergencyLevel;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        emergencyLevel,
        image,
        form,
        status,
        prescription,
        createdAt,
        updatedAt,
        userId,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'prescription': prescription,
      'title': title,
      'description': description,
      'form': form,
      'status': status,
      'userId': userId,
      'emergencyLevel': emergencyLevel,
    };
  }

  MedicationRequest toEntity() {
    return MedicationRequest(
      id: id,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      prescription: prescription,
      title: title,
      description: description,
      form: form,
      status: status,
      userId: userId,
      emergencyLevel: emergencyLevel,
    );
  }

  MedicationRequestModel copyWith({
    String? id,
    String? image,
    String? createdAt,
    String? updatedAt,
    PlatformFile? prescription,
    String? title,
    String? description,
    MedicineForm? form,
    MedicationStatus? status,
    String? userId,
    EmergencyLevel? emergencyLevel,
  }) {
    return MedicationRequestModel(
      id: id ?? this.id,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prescription: prescription ?? this.prescription,
      title: title ?? this.title,
      description: description ?? this.description,
      form: form ?? this.form,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      emergencyLevel: emergencyLevel ?? this.emergencyLevel,
    );
  }
}
