part of 'add_exchange_cubit.dart';

enum AddExchangeStatus { initial, loading, success, error }

class AddExchangeState extends Equatable {
  const AddExchangeState({
    this.medicationName = '',
    this.exchangeMedicineName = '',
    this.description = '',
    this.quantity = '',
    this.form = MedicineForm.tablet,
    this.exchangeMedicineForm = MedicineForm.tablet,
    this.medicineImage,
    this.exchangeMedicineImage,
    this.status = AddExchangeStatus.initial,
    this.emergencyLevel = EmergencyLevel.low,
    this.errorMassage,
    this.expiredAt,
    this.location,
    this.address,
  });

  final String medicationName;
  final String exchangeMedicineName;
  final String description;
  final String quantity;
  final MedicineForm form;
  final MedicineForm exchangeMedicineForm;
  final EmergencyLevel emergencyLevel;
  final PlatformFile? medicineImage;
  final PlatformFile? exchangeMedicineImage;
  final AddExchangeStatus status;
  final String? errorMassage;
  final DateTime? expiredAt;
  final LocationSudan? location;
  final String? address;

  @override
  List<Object?> get props => [
        medicationName,
        exchangeMedicineName,
        description,
        quantity,
        form,
        exchangeMedicineForm,
        medicineImage,
        exchangeMedicineImage,
        status,
        emergencyLevel,
        errorMassage,
        expiredAt,
        location,
        address,
      ];

  AddExchangeState copyWith({
    String? medicationName,
    String? exchangeMedicineName,
    String? description,
    String? quantity,
    MedicineForm? form,
    EmergencyLevel? emergencyLevel,
    MedicineForm? exchangeMedicineForm,
    PlatformFile? medicineImage,
    PlatformFile? exchangeMedicineImage,
    AddExchangeStatus? status,
    String? errorMassage,
    DateTime? expiredAt,
    LocationSudan? location,
    String? address,
  }) {
    return AddExchangeState(
      medicationName: medicationName ?? this.medicationName,
      exchangeMedicineName: exchangeMedicineName ?? this.exchangeMedicineName,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      emergencyLevel: emergencyLevel ?? this.emergencyLevel,
      form: form ?? this.form,
      exchangeMedicineForm: exchangeMedicineForm ?? this.exchangeMedicineForm,
      medicineImage: medicineImage ?? this.medicineImage,
      exchangeMedicineImage:
          exchangeMedicineImage ?? this.exchangeMedicineImage,
      status: status ?? this.status,
      errorMassage: errorMassage ?? this.errorMassage,
      expiredAt: expiredAt ?? this.expiredAt,
      location: location ?? this.location,
      address: address ?? this.address,
    );
  }
}

class AddExchangeInitial extends AddExchangeState {
  const AddExchangeInitial() : super();
}
