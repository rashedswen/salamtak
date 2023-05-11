import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import '../../../../core/enums/enums.dart';
import '../../../../util/json/states_and_cities.dart';

class AdminMedicationDonation extends Equatable {
  const AdminMedicationDonation({
    this.id,
    required this.title,
    required this.description,
    this.image,
    this.status = MedicationStatus.pending,
    required this.form,
    this.expiredAt,
    this.createdAt,
    this.updatedAt,
    required this.userId,
    this.quantity = '1',
    required this.location,
  });
  final String? id;
  final String title;
  final String description;
  final PlatformFile? image;
  final MedicineForm form;
  final MedicationStatus status;
  final String? expiredAt;
  final String? createdAt;
  final String? updatedAt;
  final String userId;
  final String? quantity;
  final LocationSudan location;

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
        form,
        status,
        createdAt,
        updatedAt,
        userId,
        quantity,
        location,
      ];
}
