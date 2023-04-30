part of 'add_donation_cubit.dart';

enum AddDonationStatus { initial, loading, success, failure }

class AddDonationState extends Equatable {

  const AddDonationState({
    this.medicationName,
    this.description,
    this.quantity,
    this.form = MedicineForm.tablet,
    this.imageUrl,
    this.status = AddDonationStatus.initial,
    this.errorMassage,
    this.expiredAt,
  });

  final String? medicationName;
  final String? description;
  final String? quantity;
  final MedicineForm form;
  final PlatformFile? imageUrl;
  final AddDonationStatus status;
  final String? errorMassage;
  final DateTime? expiredAt;

  @override
  List<Object?> get props => [
        medicationName,
        description,
        quantity,
        form,
        imageUrl,
        status,
        errorMassage,
        expiredAt
  ];

  AddDonationState copyWith({
    String? medicationName,
    String? description,
    String? quantity,
    MedicineForm? form,
    PlatformFile? imageUrl,
    AddDonationStatus? status,
    String? errorMassage,
    DateTime? expiredAt,
  }) {
    return AddDonationState(
      medicationName: medicationName ?? this.medicationName,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      form: form ?? this.form,
      imageUrl: imageUrl ?? this.imageUrl,
      status: status ?? this.status,
      errorMassage: errorMassage ?? this.errorMassage,
      expiredAt: expiredAt ?? this.expiredAt,
    );
  } 


  
}
