part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  /// {@macro profile}
  const ProfileState({
    this.email,
    this.password,
    this.status = ProfileStatus.initial,
    this.providers = const ProvidersId(),
  });

  /// A description for customProperty
  final String? email;
  final String? password;
  final ProfileStatus status;
  final ProvidersId providers;

  @override
  List<Object?> get props => [email, password, status, providers];

  /// Creates a copy of the current ProfileState with property changes
  ProfileState copyWith({
    String? email,
    String? password,
    ProfileStatus? status,
    ProvidersId? providers,
  }) {
    return ProfileState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
      providers: providers ?? this.providers,
    );
  }
}

/// {@template profile_initial}
/// The initial state of ProfileState
/// {@endtemplate}
class ProfileInitial extends ProfileState {
  /// {@macro profile_initial}
  const ProfileInitial() : super();
}
