part of 'medication_details_cubit.dart';

enum MedicationDetailsMedicationInfoStatus { initial, loading, loaded, error }

enum MedicationDetailsUserListStatus { initial, loading, loaded, error }

enum MedicationDetailsSubmitRequestStatus { initial, success, error, loading }

class MedicationDetailsState extends Equatable {
  const MedicationDetailsState({
    this.errorMessage = 'Default Value',
    required this.medicationId,
    this.medicationItem,
    this.usersAcceptedRequest,
    this.medicationInfoStatus = MedicationDetailsMedicationInfoStatus.initial,
    this.usersListStatus = MedicationDetailsUserListStatus.initial,
    this.submitStatus = MedicationDetailsSubmitRequestStatus.initial,
  });

  final String errorMessage;
  final String medicationId;
  final MedicationItem? medicationItem;
  final List<UsersAcceptedRequests>? usersAcceptedRequest;
  final MedicationDetailsMedicationInfoStatus medicationInfoStatus;
  final MedicationDetailsUserListStatus usersListStatus;
  final MedicationDetailsSubmitRequestStatus submitStatus;

  @override
  List<Object?> get props => [
        medicationId,
        errorMessage,
        medicationItem,
        usersAcceptedRequest,
        medicationInfoStatus,
        usersListStatus,
        submitStatus,
      ];

  MedicationDetailsState copyWith({
    String? medicationId,
    String? errorMessage,
    MedicationItem? medicationItem,
    MedicationDetailsMedicationInfoStatus? medicationInfoStatus,
    List<UsersAcceptedRequests>? usersAcceptedRequest,
    MedicationDetailsUserListStatus? usersListStatus,
    MedicationDetailsSubmitRequestStatus? submitStatus,
  }) {
    return MedicationDetailsState(
      medicationId: medicationId ?? this.medicationId,
      errorMessage: errorMessage ?? this.errorMessage,
      medicationItem: medicationItem ?? this.medicationItem,
      medicationInfoStatus: medicationInfoStatus ?? this.medicationInfoStatus,
      usersAcceptedRequest: usersAcceptedRequest ?? this.usersAcceptedRequest,
      usersListStatus: usersListStatus ?? this.usersListStatus,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }
}

class MedicationDetailsInitial extends MedicationDetailsState {
  /// {@macro medication_details_initial}
  const MedicationDetailsInitial(String medicationId,
      {super.medicationItem,})
      : super(medicationId: medicationId);
}
