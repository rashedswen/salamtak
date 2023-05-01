import 'package:salamtak/features/medication_feature/util/enums/enums.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationList {
  MedicationList({
    required this.name,
    this.location,
    required this.requestType,
    required this.price,
    this.image,
    this.emergencyLevel,
    required this.createdDate,
    required this.form,
  });

  final String name;
  final LocationSudan? location;
  final MedicationRequestType requestType;
  final double price;
  final String? image;
  final EmergencyLevel? emergencyLevel;
  final DateTime createdDate;
  final MedicineForm form;
}
