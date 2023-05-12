part of 'medication_details_cubit.dart';

enum MedicationDetailsUsersListStatus { initial, loading, loaded, error }

class MedicationDetailsState extends Equatable with FormzMixin {
  const MedicationDetailsState({
    this.errorMessage = 'Default Value',
    required this.medicationItem,
    this.name = const Name.pure(),
    this.phoneNumber = const PhoneNumber.pure(),
    this.location,
    this.address = const Address.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.usersAcceptedRequest,
    this.usersListStatus = MedicationDetailsUsersListStatus.initial,
  });

  final String errorMessage;
  final MedicationItem medicationItem;
  final Name name;
  final PhoneNumber phoneNumber;
  final LocationSudan? location;
  final Address address;
  final FormzSubmissionStatus status;
  final List<UsersAcceptedRequests>? usersAcceptedRequest;
  final MedicationDetailsUsersListStatus usersListStatus;

  @override
  List<Object?> get props => [
        errorMessage,
        medicationItem,
        name,
        phoneNumber,
        location,
        address,
        status,
        usersAcceptedRequest,
        usersListStatus,
      ];

  MedicationDetailsState copyWith({
    String? errorMessage,
    MedicationItem? medicationItem,
    Name? name,
    PhoneNumber? phoneNumber,
    LocationSudan? location,
    Address? address,
    FormzSubmissionStatus? status,
    List<UsersAcceptedRequests>? usersAcceptedRequest,
    MedicationDetailsUsersListStatus? usersListStatus,
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
      usersListStatus: usersListStatus ?? this.usersListStatus,
    );
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [name, phoneNumber, address];
}

class MedicationDetailsInitial extends MedicationDetailsState {
  /// {@macro medication_details_initial}
  const MedicationDetailsInitial(MedicationItem medicationItem)
      : super(medicationItem: medicationItem);
}
