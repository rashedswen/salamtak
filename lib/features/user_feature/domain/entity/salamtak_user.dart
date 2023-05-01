import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// {@macro user}
  const User({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.gender,
    this.birthDate,
    this.region,
    this.authorization,
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
  /// Empty user which represents an unauthenticated user.
  static const empty = User(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;

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
    };
  }
  

  @override
  List<Object?> get props => [email, id, name, photo];
}
