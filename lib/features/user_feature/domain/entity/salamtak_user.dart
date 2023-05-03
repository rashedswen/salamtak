import 'package:equatable/equatable.dart';
import 'package:salamtak/features/user_feature/data/model/salamtak_user_model.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

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
