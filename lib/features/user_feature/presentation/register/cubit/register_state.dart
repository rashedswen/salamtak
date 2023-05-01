part of 'register_cubit.dart';

/// {@template register}
/// RegisterState description
/// {@endtemplate}
class RegisterState extends Equatable {
  /// {@macro register}
  const RegisterState({
    this.customProperty = 'Default Value',
  });

  /// A description for customProperty
  final String customProperty;

  @override
  List<Object> get props => [customProperty];

  /// Creates a copy of the current RegisterState with property changes
  RegisterState copyWith({
    String? customProperty,
  }) {
    return RegisterState(
      customProperty: customProperty ?? this.customProperty,
    );
  }
}
/// {@template register_initial}
/// The initial state of RegisterState
/// {@endtemplate}
class RegisterInitial extends RegisterState {
  /// {@macro register_initial}
  const RegisterInitial() : super();
}
