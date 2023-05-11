import 'package:equatable/equatable.dart';
import '../../domain/entity/salamtak_user.dart';
import '../../../../util/json/states_and_cities.dart';

class SalamtakUserModel extends Equatable {
  const SalamtakUserModel({
    required this.id,
    this.email,
    this.name,
    this.authorization,
    this.location,
    this.phoneNumber,
    this.isActivated = true,
  });

  // from json
  factory SalamtakUserModel.fromJson(Map<String, dynamic> json) {
    return SalamtakUserModel(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      authorization: json['authorization'] as String?,
      location: json['location'] != null
          ? LocationSudan.fromJson(json['location'] as Map<String, dynamic>)
          : null,
      isActivated: json['is_activated'] as bool,
    );
  }

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  final String? phoneNumber;

  final String? authorization;

  final LocationSudan? location;

  final bool isActivated;

  /// Creates a new user from a [Map].
  ///
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'authorization': authorization,
      'is_activated': true,
      'location': location?.toJson(),
      'phone_number': phoneNumber,
    };
  }

  SalamtakUserModel copyWith({
    String? email,
    String? id,
    String? name,
    String? phoneNumber,
    String? authorization,
    LocationSudan? location,
    bool? isActivated,
  }) {
    return SalamtakUserModel(
      email: email ?? this.email,
      id: id ?? this.id,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      authorization: authorization ?? this.authorization,
      location: location ?? this.location,
      isActivated: isActivated ?? this.isActivated,
    );
  }

  SalamtakUser toEntity() {
    return SalamtakUser(
      email: email,
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      authorization: authorization,
      location: location,
      isActivated: isActivated,
    );
  }

  @override
  List<Object?> get props =>
      [email, id, name, location, phoneNumber, isActivated, authorization];
}
