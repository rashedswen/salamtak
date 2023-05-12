import 'package:equatable/equatable.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_donation.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class MedicationDonationModel extends Equatable {
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
      expiredAt: map['expiredAt'] as int?,
      createdAt: map['createdAt'] as int?,
      updatedAt: map['updatedAt'] as int?,
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
  final int? createdAt;
  final int? updatedAt;
  final String userId;
  final LocationSudan location;
  final int? expiredAt;
  final String? quantity;

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
    int? expiredAt,
    int? createdAt,
    int? updatedAt,
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

  MedicationItem toMedicationListItem() {
    return MedicationItem(
      id: id!,
      createdDate: DateTime.fromMillisecondsSinceEpoch(createdAt ?? 0),
      description: description,
      name: title,
      requestType: MedicationRequestType.donation,
      form: form,
      location: location,
      image: image,
      emergencyLevel: EmergencyLevel.low,
      status: status,
      userId: userId,
    );
  }
}
