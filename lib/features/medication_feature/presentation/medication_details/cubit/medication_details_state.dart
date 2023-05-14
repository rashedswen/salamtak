part of 'medication_details_cubit.dart';

enum MedicationDetailsUserListStatus { initial, loading, loaded, error }

enum MedicationDetailsSubmitRequestStatus { initial, success, error, loading }

class MedicationDetailsState extends Equatable {
  const MedicationDetailsState({
    this.errorMessage = 'Default Value',
    required this.medicationItem,
    this.usersAcceptedRequest,
    this.usersListStatus = MedicationDetailsUserListStatus.initial,
    this.submitStatus = MedicationDetailsSubmitRequestStatus.initial,
  });

  final String errorMessage;
  final MedicationItem medicationItem;
  final List<UsersAcceptedRequests>? usersAcceptedRequest;
  final MedicationDetailsUserListStatus usersListStatus;
  final MedicationDetailsSubmitRequestStatus submitStatus;

  @override
  List<Object?> get props => [
        errorMessage,
        medicationItem,
        usersAcceptedRequest,
        usersListStatus,
        submitStatus,
      ];

  MedicationDetailsState copyWith({
    String? errorMessage,
    MedicationItem? medicationItem,
    List<UsersAcceptedRequests>? usersAcceptedRequest,
    MedicationDetailsUserListStatus? usersListStatus,
    MedicationDetailsSubmitRequestStatus? submitStatus,
  }) {
    return MedicationDetailsState(
      errorMessage: errorMessage ?? this.errorMessage,
      medicationItem: medicationItem ?? this.medicationItem,
      usersAcceptedRequest: usersAcceptedRequest ?? this.usersAcceptedRequest,
      usersListStatus: usersListStatus ?? this.usersListStatus,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

class MedicationDetailsInitial extends MedicationDetailsState {
  /// {@macro medication_details_initial}
  const MedicationDetailsInitial(MedicationItem medicationItem)
      : super(medicationItem: medicationItem);
}
