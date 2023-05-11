import 'package:equatable/equatable.dart';
import '../../../../core/enums/enums.dart';
import '../../../../util/json/states_and_cities.dart';

class AdminMedicationList extends Equatable {
  const AdminMedicationList({
    required this.id,
    required this.name,
    this.description,
    this.location,
    required this.requestType,
    this.price,
    this.image,
    this.emergencyLevel,
    required this.createdDate,
    required this.form,
    required this.status,
  });

  final String id;
  final String name;
  final String? description;
  final LocationSudan? location;
  final MedicationRequestType requestType;
  final double? price;
  final String? image;
  final EmergencyLevel? emergencyLevel;
  final DateTime createdDate;
  final MedicineForm form;
  final MedicationStatus status;

  @override
  List<Object?> get props => [
        id,
        name,
        location,
        requestType,
        price,
        image,
        emergencyLevel,
        createdDate,
        form,
        status,
      ];
}
