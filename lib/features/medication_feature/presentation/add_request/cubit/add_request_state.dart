part of 'add_request_cubit.dart';

enum AddRequestStatus { initial, loading, success, failure }

class AddRequestState extends Equatable {
  /// {@macro add_request}
  const AddRequestState({
    this.description,
    this.emergencyLevel = EmergencyLevel.low,
    this.form = MedicineForm.tablet,
    this.prescription,
    this.title,
    this.status = AddRequestStatus.initial,
    this.errorMassage,
  });

  final String? title;
  final String? description;
  final EmergencyLevel emergencyLevel;
  final MedicineForm form;
  final PlatformFile? prescription;
  final AddRequestStatus status;
  final String? errorMassage;

  @override
  List<Object?> get props => [
        title,
        description,
        emergencyLevel,
        form,
        prescription,
        status,
        errorMassage
      ];

  AddRequestState copyWith({
    String? title,
    String? description,
    EmergencyLevel? emergencyLevel,
    MedicineForm? form,
    PlatformFile? prescription,
    AddRequestStatus? status,
    String? errorMassage,
  }) {
    return AddRequestState(
      title: title ?? this.title,
      description: description ?? this.description,
      emergencyLevel: emergencyLevel ?? this.emergencyLevel,
      form: form ?? this.form,
      prescription: prescription ?? this.prescription,
      status: status ?? this.status,
      errorMassage: errorMassage ?? this.errorMassage,
    );
  }
}
