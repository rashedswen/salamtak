part of 'donation_details_cubit.dart';

/// {@template donation_details}
/// DonationDetailsState description
/// {@endtemplate}
class DonationDetailsState extends Equatable {
  /// {@macro donation_details}
  const DonationDetailsState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current DonationDetailsState with property changes
  DonationDetailsState copyWith({
    String? customProperty,
  }) {
    return DonationDetailsState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template donation_details_initial}
/// The initial state of DonationDetailsState
/// {@endtemplate}
class DonationDetailsInitial extends DonationDetailsState {
  /// {@macro donation_details_initial}
  const DonationDetailsInitial() : super();
}
