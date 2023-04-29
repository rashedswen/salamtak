part of 'add_donation_cubit.dart';

/// {@template add_donation}
/// AddDonationState description
/// {@endtemplate}
class AddDonationState extends Equatable {
  /// {@macro add_donation}
  const AddDonationState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddDonationState with property changes
  AddDonationState copyWith({
    String? customProperty,
  }) {
    return AddDonationState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template add_donation_initial}
/// The initial state of AddDonationState
/// {@endtemplate}
class AddDonationInitial extends AddDonationState {
  /// {@macro add_donation_initial}
  const AddDonationInitial() : super();
}
