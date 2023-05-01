import 'package:equatable/equatable.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class SalamtakUser extends Equatable {
  /// {@macro user}
  const SalamtakUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.gender,
    this.birthDate,
    this.region,
    this.authorization,
    this.location,
  });

  final String? gender;

  final String? birthDate;

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  final String? region;

  final String? authorization;

  final LocationSudan? location;

  /// Empty user which represents an unauthenticated user.
  static const empty = SalamtakUser(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == SalamtakUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != SalamtakUser.empty;

  /// Creates a new user from a [Map].
  ///
  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'birthDate': birthDate,
      'name': name,
      'region': region,
      'email': email,
      'id': id,
      'photo': photo,
      'authorization': authorization,
      'isActivated': true,
      'location': location?.toJson(),
    };
  }

  @override
  List<Object?> get props => [email, id, name, photo, location];
}
