part of 'profile_cubit.dart';

enum ProfileStatus { initial, loading, success, error }

class ProfileState extends Equatable {
  /// {@macro profile}
  const ProfileState({
    this.name,
    this.email,
    this.password,
    this.status = ProfileStatus.initial,
    this.providers = const ProvidersId(),
    this.userRequests,
    this.location,
    this.address,
    this.error,
  });

  /// A description for customProperty
  final String? name;
  final String? email;
  final String? password;
  final LocationSudan? location;
  final String? address;
  final ProfileStatus status;
  final ProvidersId providers;
  final List<MedicationItem>? userRequests;
  final String? error;

  @override
  List<Object?> get props =>
      [name, email, password, status, providers, userRequests, location, address, error];

  /// Creates a copy of the current ProfileState with property changes
  ProfileState copyWith({
    String? name,
    String? email,
    String? password,
    LocationSudan? location,
    ProfileStatus? status,
    ProvidersId? providers,
    List<MedicationItem>? userRequests,
    String? address,
    String? error,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      location: location ?? this.location,
      status: status ?? this.status,
      providers: providers ?? this.providers,
      userRequests: userRequests ?? this.userRequests,
      address: address ?? this.address,
      error: error ?? this.error,
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
