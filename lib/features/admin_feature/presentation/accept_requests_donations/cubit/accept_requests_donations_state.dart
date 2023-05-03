part of 'accept_requests_donations_cubit.dart';

/// {@template accept_requests_donations}
/// AcceptRequestsDonationsState description
/// {@endtemplate}
class AcceptRequestsDonationsState extends Equatable {
  /// {@macro accept_requests_donations}
  const AcceptRequestsDonationsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AcceptRequestsDonationsState with property changes
  AcceptRequestsDonationsState copyWith({
    String? customProperty,
  }) {
    return AcceptRequestsDonationsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template accept_requests_donations_initial}
/// The initial state of AcceptRequestsDonationsState
/// {@endtemplate}
class AcceptRequestsDonationsInitial extends AcceptRequestsDonationsState {
  /// {@macro accept_requests_donations_initial}
  const AcceptRequestsDonationsInitial() : super();
}
