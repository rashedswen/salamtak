import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/models.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationRequest extends Equatable {
  const MedicationRequest({
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

  final String? id;
  final String? image;
  // automaticly set to current date
  final int? createdAt;
  final int? updatedAt;
  final String? prescription;
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

  MedicationRequestModel toModel() {
    return MedicationRequestModel(
      id: id,
      title: title,
      description: description,
      form: form,
      status: status,
      prescription: prescription,
      image: image,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      userId: userId,
      emergencyLevel: emergencyLevel,
      location: location,
    );
  }
}
