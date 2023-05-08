part of 'medication_details_cubit.dart';

/// {@template medication_details}
/// MedicationDetailsState description
/// {@endtemplate}
class MedicationDetailsState extends Equatable with FormzMixin {
  /// {@macro medication_details}
  const MedicationDetailsState({
    this.errorMessage = 'Default Value',
    required this.medicationItem,
    this.name = const Name.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.location,
    this.address = const Address.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.usersAcceptedRequest,
  });

  /// A description for customProperty
  final String errorMessage;
  final MedicationItem medicationItem;
  final Name name;
  final PhoneNumber phoneNumber;
  final LocationSudan? location;
  final Address address;
  final FormzSubmissionStatus status;
  final List<UsersAcceptedRequests>? usersAcceptedRequest;

  @override
  List<Object?> get props => [
        errorMessage,
        medicationItem,
        name,
        phoneNumber,
        location,
        address,
        status,
        usersAcceptedRequest
      ];

  /// Creates a copy of the current MedicationDetailsState with property changes
  MedicationDetailsState copyWith({
    String? errorMessage,
    MedicationItem? medicationItem,
    Name? name,
    PhoneNumber? phoneNumber,
    LocationSudan? location,
    Address? address,
    FormzSubmissionStatus? status,
    List<UsersAcceptedRequests>? usersAcceptedRequest,
  }) {
    return MedicationDetailsState(
      errorMessage: errorMessage ?? this.errorMessage,
      medicationItem: medicationItem ?? this.medicationItem,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      location: location ?? this.location,
      address: address ?? this.address,
      status: status ?? this.status,
      usersAcceptedRequest: usersAcceptedRequest ?? this.usersAcceptedRequest,
    );
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [name, phoneNumber, address];
}

/// {@template medication_details_initial}
/// The initial state of MedicationDetailsState
/// {@endtemplate}
class MedicationDetailsInitial extends MedicationDetailsState {
  /// {@macro medication_details_initial}
  const MedicationDetailsInitial(MedicationItem medicationItem)
      : super(medicationItem: medicationItem);
}
