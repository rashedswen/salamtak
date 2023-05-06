part of 'accept_requests_donations_cubit.dart';

enum AcceptRequestsDonationsStatus { initial, loading, loaded, error }

class AcceptRequestsDonationsState extends Equatable {
  const AcceptRequestsDonationsState({
    this.rejectionReason,
    this.medicationsList = const [],
    this.errorMessage,
  });

  final List<AdminMedicationList> medicationsList;
  final String? rejectionReason;
  final String? errorMessage;

  @override
  List<Object?> get props => [rejectionReason, medicationsList, errorMessage];

  AcceptRequestsDonationsState copyWith({
    String? rejectionReason,
    List<AdminMedicationList>? medicationsList,
    AcceptRequestsDonationsStatus? status,
    String? errorMessage,
  }) {
    return AcceptRequestsDonationsState(
      rejectionReason: rejectionReason ?? this.rejectionReason,
      medicationsList: medicationsList ?? this.medicationsList,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class AcceptRequestsDonationsInitial extends AcceptRequestsDonationsState {
  const AcceptRequestsDonationsInitial() : super();
}

class AcceptRequestsDonationsLoading extends AcceptRequestsDonationsState {
  const AcceptRequestsDonationsLoading() : super();
}

class AcceptRequestsDonationsLoaded extends AcceptRequestsDonationsState {
  const AcceptRequestsDonationsLoaded(List<AdminMedicationList> medicationsList)
      : super(medicationsList: medicationsList);
}

class AcceptRequestsDonationsError extends AcceptRequestsDonationsState {
  const AcceptRequestsDonationsError(String errorMessage)
      : super(errorMessage: errorMessage);
}
