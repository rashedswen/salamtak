part of 'add_request_cubit.dart';

enum AddRequestStatus { initial, loading, success, failure }

class AddRequestState extends Equatable {
  /// {@macro add_request}
  const AddRequestState(
      {this.description,
      this.emergencyLevel = EmergencyLevel.low,
      this.form = MedicineForm.tablet,
      this.prescription,
      this.image,
      this.title,
      this.status = AddRequestStatus.initial,
      this.errorMassage,
      this.location,
      this.address,});

  final String? title;
  final String? description;
  final EmergencyLevel emergencyLevel;
  final MedicineForm form;
  final PlatformFile? prescription;
  final PlatformFile? image;
  final AddRequestStatus status;
  final String? errorMassage;
  final LocationSudan? location;
  final String? address;

  @override
  List<Object?> get props => [
        title,
        description,
        emergencyLevel,
        form,
        prescription,
        image,
        status,
        errorMassage,
        location,
        address
      ];

  AddRequestState copyWith(
      {String? title,
      String? description,
      EmergencyLevel? emergencyLevel,
      MedicineForm? form,
      PlatformFile? prescription,
      PlatformFile? image,
      AddRequestStatus? status,
      String? errorMassage,
      LocationSudan? location,
      String? address,}) {
    return AddRequestState(
        title: title ?? this.title,
        description: description ?? this.description,
        emergencyLevel: emergencyLevel ?? this.emergencyLevel,
        form: form ?? this.form,
        prescription: prescription ?? this.prescription,
        image: image ?? this.image,
        status: status ?? this.status,
        errorMassage: errorMassage ?? this.errorMassage,
        location: location ?? this.location,
        address: address ?? this.address,);
  }
}
