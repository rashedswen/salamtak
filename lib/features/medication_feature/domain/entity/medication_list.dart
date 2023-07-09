import 'package:equatable/equatable.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/util/json/states_and_cities.dart';


class MedicationItem extends Equatable {
  const MedicationItem({
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
    required this.userId,
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
  final String userId;

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
        userId,
      ];
}
