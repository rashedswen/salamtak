part of 'users_cubit.dart';

/// {@template users}
/// UsersState description
/// {@endtemplate}
class UsersState extends Equatable {
  /// {@macro users}
  const UsersState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current UsersState with property changes
  UsersState copyWith({
    String? customProperty,
  }) {
    return UsersState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template users_initial}
/// The initial state of UsersState
/// {@endtemplate}
class UsersInitial extends UsersState {
  /// {@macro users_initial}
  const UsersInitial() : super();
}
