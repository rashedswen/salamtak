part of 'add_exchange_cubit.dart';

/// {@template add_exchange}
/// AddExchangeState description
/// {@endtemplate}
class AddExchangeState extends Equatable {
  /// {@macro add_exchange}
  const AddExchangeState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddExchangeState with property changes
  AddExchangeState copyWith({
    String? customProperty,
  }) {
    return AddExchangeState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template add_exchange_initial}
/// The initial state of AddExchangeState
/// {@endtemplate}
class AddExchangeInitial extends AddExchangeState {
  /// {@macro add_exchange_initial}
  const AddExchangeInitial() : super();
}
