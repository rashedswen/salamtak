import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_request.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationRequestModel extends Equatable {
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
    required this.location,
  });
  factory MedicationRequestModel.fromJson(Map<String, dynamic> map) {
    return MedicationRequestModel(
      id: map['id'] as String?,
      image: map['image'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      title: map['title'] as String,
      description: map['description'] as String,
      form: (map['form'] as String).toMedicineForm,
      status: (map['status'] as String).toMedicineStatus,
      userId: map['userId'] as String,
      emergencyLevel: (map['emergencyLevel'] as String).toEmergencyLevel,
      location: LocationSudan.fromJson(map['location'] as Map<String, dynamic>),
      
    );
  }

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
  final LocationSudan location;

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
        location
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'title': title,
      'description': description,
      'form': form.name,
      'status': status.name,
      'userId': userId,
      'emergencyLevel': emergencyLevel.name,
      'location': location.toJson()
    };
  }

  MedicationRequest toEntity() {
    return MedicationRequest(
      id: id,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      title: title,
      description: description,
      form: form,
      status: status,
      userId: userId,
      emergencyLevel: emergencyLevel,
      location: location,
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
    LocationSudan? location,
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
      location: location ?? this.location,
    );
  }

  MedicationList toMedicationListItem() {
    return MedicationList(
      createdDate: DateTime.tryParse(createdAt!) ?? DateTime.now(),
      description: description,
      name: title,
      requestType: MedicationRequestType.request,
      form: form,
      location: location,
      image: image,
      emergencyLevel: emergencyLevel,
      status: status,
    );
  }
}
