import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/enums/enums.dart';
import '../../../../util/json/states_and_cities.dart';

class AdmimMedicationRequest extends Equatable {
  const AdmimMedicationRequest({
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

  AdmimMedicationRequest toModel() {
    return AdmimMedicationRequest(
      id: id,
      title: title,
      description: description,
      image: image,
      form: form,
      status: status,
      prescription: prescription,
      createdAt: DateTime.now().toIso8601String(),
      updatedAt: DateTime.now().toIso8601String(),
      userId: userId,
      emergencyLevel: emergencyLevel,
      location: location,
    );
  }
}
