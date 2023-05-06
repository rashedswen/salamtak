part of 'user_requests_history_cubit.dart';

class UserRequestsHistoryState extends Equatable {
  const UserRequestsHistoryState({
    this.errorMessage = 'Default Value',
    this.medicationItems,
  });

  final String errorMessage;
  final List<MedicationItem>? medicationItems;

  @override
  List<Object?> get props => [errorMessage, medicationItems];

  UserRequestsHistoryState copyWith({
    String? errorMessage,
    List<MedicationItem>? medicationItems,
  }) {
    return UserRequestsHistoryState(
      errorMessage: errorMessage ?? this.errorMessage,
      medicationItems: medicationItems ?? this.medicationItems,
    );
  }
}

class UserRequestsHistoryInitial extends UserRequestsHistoryState {
  const UserRequestsHistoryInitial() : super();
}

class UserRequestsHistoryLoading extends UserRequestsHistoryState {
  const UserRequestsHistoryLoading() : super();
}

class UserRequestsHistoryLoaded extends UserRequestsHistoryState {
  const UserRequestsHistoryLoaded({
    required List<MedicationItem> medicationItems,
  }) : super(medicationItems: medicationItems);
}

class UserRequestsHistoryError extends UserRequestsHistoryState {
  const UserRequestsHistoryError({
    required super.errorMessage,
  });
}
