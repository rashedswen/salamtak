import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/shared/entities/medication_list.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationDonationModel {
  const MedicationDonationModel({
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
    this.quantity,
    required this.location,
  });
  factory MedicationDonationModel.fromJson(Map<String, dynamic> map) {
    return MedicationDonationModel(
      id: map['id'] as String?,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String?,
      form: (map['form'] as String).toMedicineForm,
      status: (map['status'] as String).toMedicineStatus,
      expiredAt: map['expiredAt'] as String?,
      createdAt: map['createdAt'] as String?,
      updatedAt: map['updatedAt'] as String?,
      userId: map['userId'] as String,
      quantity: map['quantity'] as String?,
      location: LocationSudan.fromJson(map['location'] as Map<String, dynamic>),
    );
  }
  final String? id;
  final String title;
  final String description;
  final String? image;
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
        expiredAt,
        quantity,
        location,
      ];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'form': form.name,
      'status': status.name,
      'expiredAt': expiredAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'userId': userId,
      'quantity': quantity,
      'location': location.toJson(),
    };
  }

  MedicationDonationModel copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    MedicineForm? form,
    MedicationStatus? status,
    String? expiredAt,
    String? createdAt,
    String? updatedAt,
    String? userId,
    String? quantity,
  }) {
    return MedicationDonationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      form: form ?? this.form,
      status: status ?? this.status,
      expiredAt: expiredAt ?? this.expiredAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      quantity: quantity ?? this.quantity,
      location: location,
    );
  }

  MedicationDonation toEntity() {
    return MedicationDonation(
      id: id,
      title: title,
      description: description,
      form: form,
      status: status,
      expiredAt: expiredAt,
      createdAt: createdAt,
      updatedAt: updatedAt,
      userId: userId,
      quantity: quantity,
      location: location,
    );
  }

  MedicationList toMedicationListItem() {
    return MedicationList(
      createdDate: DateTime.tryParse(createdAt!) ?? DateTime.now(),
      description: description,
      name: title,
      requestType: MedicationRequestType.donation,
      form: form,
      location: location,
      image: image,
      emergencyLevel: EmergencyLevel.low,
      status: status,
    );
  }
}
