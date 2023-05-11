import 'package:equatable/equatable.dart';
import '../../data/model/salamtak_user_model.dart';
import '../../../../util/json/states_and_cities.dart';

class SalamtakUser extends Equatable {
  /// {@macro user}
  const SalamtakUser({
    required this.id,
    this.email,
    this.name,
    this.authorization,
    this.location,
    this.phoneNumber,
    this.isActivated = true,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  final String? authorization;

  final LocationSudan? location;

  final String? phoneNumber;

  final bool isActivated;

  /// Empty user which represents an unauthenticated user.
  static const empty = SalamtakUser(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == SalamtakUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != SalamtakUser.empty;

  SalamtakUserModel toModel() {
    return SalamtakUserModel(
      id: id,
      email: email,
      name: name,
      authorization: authorization,
      location: location,
      phoneNumber: phoneNumber,
      isActivated: isActivated,
    );
  }

  SalamtakUser copyWith({
    String? email,
    String? id,
    String? name,
    String? authorization,
    LocationSudan? location,
    String? phoneNumber,
    bool? isActivated,
  }) {
    return SalamtakUser(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      authorization: authorization ?? this.authorization,
      location: location ?? this.location,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isActivated: isActivated ?? this.isActivated,
    );
  }

  @override
  List<Object?> get props => [
        email,
        id,
        name,
        phoneNumber,
        location,
        isActivated,
        authorization,
        location,
        phoneNumber,
      ];
}
