part of 'add_request_cubit.dart';

/// {@template add_request}
/// AddRequestState description
/// {@endtemplate}
class AddRequestState extends Equatable {
  /// {@macro add_request}
  const AddRequestState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current AddRequestState with property changes
  AddRequestState copyWith({
    String? customProperty,
  }) {
    return AddRequestState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template add_request_initial}
/// The initial state of AddRequestState
/// {@endtemplate}
class AddRequestInitial extends AddRequestState {
  /// {@macro add_request_initial}
  const AddRequestInitial() : super();
}
