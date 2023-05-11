import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/enums/enums.dart';
import '../../domain/entity/entities.dart';
import '../../../../util/json/states_and_cities.dart';

class AdminMedicationRequestModel extends Equatable {
  const AdminMedicationRequestModel({
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
  factory AdminMedicationRequestModel.fromJson(Map<String, dynamic> map) {
    return AdminMedicationRequestModel(
      id: map['id'] as String?,
      image: map['image'] as String?,
      createdAt: map['createdAt'] as int?,
      updatedAt: map['updatedAt'] as int?,
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
  final int? createdAt;
  final int? updatedAt;
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

  AdminMedicationRequestModel copyWith({
    String? id,
    String? image,
    int? createdAt,
    int? updatedAt,
    PlatformFile? prescription,
    String? title,
    String? description,
    MedicineForm? form,
    MedicationStatus? status,
    String? userId,
    EmergencyLevel? emergencyLevel,
    LocationSudan? location,
  }) {
    return AdminMedicationRequestModel(
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

  AdminMedicationList toMedicationListItem() {
    return AdminMedicationList(
      id: id!,
      createdDate: DateTime.fromMillisecondsSinceEpoch(createdAt ?? 0),
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
