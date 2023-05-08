// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_accepted_requests_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersAcceptedRequestsModel _$UsersAcceptedRequestsModelFromJson(
        Map<String, dynamic> json) =>
    UsersAcceptedRequestsModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phone_number'] as String?,
      location: json['location'] == null
          ? null
          : LocationSudan.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersAcceptedRequestsModelToJson(
        UsersAcceptedRequestsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'location': instance.location,
    };
