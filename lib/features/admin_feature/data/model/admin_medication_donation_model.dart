import '../../../../core/enums/enums.dart';
import '../../domain/entity/entities.dart';
import '../../../../util/json/states_and_cities.dart';

class AdminMedicationDonationModel {
  const AdminMedicationDonationModel({
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
  factory AdminMedicationDonationModel.fromJson(Map<String, dynamic> map) {
    return AdminMedicationDonationModel(
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
        expiredAt,
        quantity,
        location,
      ];

  AdminMedicationDonationModel copyWith({
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
    return AdminMedicationDonationModel(
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

  AdminMedicationList toMedicationListItem() {
    return AdminMedicationList(
      id: id!,
      createdDate:
          DateTime.fromMillisecondsSinceEpoch(createdAt ?? 0, isUtc: true),
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
