import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/data/model/models.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationDonation extends Equatable {
  const MedicationDonation({
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
  final String? image;
  final MedicineForm form;
  final MedicationStatus status;
  final int? expiredAt;
  final int? createdAt;
  final int? updatedAt;
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

  MedicationDonationModel toModel() {
    return MedicationDonationModel(
      id: id,
      title: title,
      description: description,
      image: image,
      form: form,
      status: status,
      expiredAt: expiredAt,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      updatedAt: DateTime.now().millisecondsSinceEpoch,
      userId: userId,
      quantity: quantity,
      location: location,
    );
  }
}
