import 'package:equatable/equatable.dart';

class ProvidersId extends Equatable {
  const ProvidersId({
    this.twitter = false,
    this.facebook = false,
    this.google = false,
    this.apple = false,
    this.email = false,
    this.anonymous = true,
    this.phone = false,
  });

  final bool twitter;
  final bool facebook;
  final bool google;
  final bool apple;
  final bool email;
  final bool anonymous;
  final bool phone;

  ProvidersId copyWith({
    bool? twitter,
    bool? facebook,
    bool? google,
    bool? apple,
    bool? email,
    bool? anonymous,
    bool? phone,
  }) {
    return ProvidersId(
      twitter: twitter ?? this.twitter,
      facebook: facebook ?? this.facebook,
      google: google ?? this.google,
      apple: apple ?? this.apple,
      email: email ?? this.email,
      anonymous: anonymous ?? this.anonymous,
      phone: phone ?? this.phone,
    );
  }

  static ProvidersId empty = const ProvidersId();

  @override
  List<Object?> get props => [
        twitter,
        facebook,
        google,
        apple,
        email,
        anonymous,
        phone,
      ];
}
