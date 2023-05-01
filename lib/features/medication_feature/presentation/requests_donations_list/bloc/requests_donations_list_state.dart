part of 'requests_donations_list_bloc.dart';

enum RequestsDonationsListStatus { initial, loading, success, failure }

/// {@template requests_donations_list_state}
/// RequestsDonationsListState description
/// {@endtemplate}
class RequestsDonationsListState extends Equatable {
  /// {@macro requests_donations_list_state}
  const RequestsDonationsListState({
    this.medicationsList = const [],
    this.status = RequestsDonationsListStatus.initial,
  });

 

  @override
  List<Object> get props => [medicationsList];

  final List<MedicationList> medicationsList;
  final RequestsDonationsListStatus status;

  RequestsDonationsListState copyWith({
    List<MedicationList>? medicationsList,
    RequestsDonationsListStatus? status,
  }) {
    return RequestsDonationsListState(
      medicationsList: medicationsList ?? this.medicationsList,
      status: status ?? this.status,
    );
  }
}

/// {@template requests_donations_list_initial}
/// The initial state of RequestsDonationsListState
/// {@endtemplate}
class RequestsDonationsListInitial extends RequestsDonationsListState {
  /// {@macro requests_donations_list_initial}
  const RequestsDonationsListInitial() : super();
}
