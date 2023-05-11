import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/users_accepted_requests.dart';
import '../../../../util/json/states_and_cities.dart';

part 'users_accepted_requests_model.g.dart';

@JsonSerializable()
class UsersAcceptedRequestsModel extends Equatable {
  const UsersAcceptedRequestsModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.location,
  });
  factory UsersAcceptedRequestsModel.fromJson(Map<String, dynamic> json) =>
      _$UsersAcceptedRequestsModelFromJson(json);

  final String? id;
  final String? name;
  @JsonKey(name: 'phone_number')
  final String? phoneNumber;
  final LocationSudan? location;

  Map<String, dynamic> toJson() => _$UsersAcceptedRequestsModelToJson(this);

  UsersAcceptedRequests toEntity() {
    return UsersAcceptedRequests(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      location: location,
    );
  }

  @override
  List<Object?> get props => [name, phoneNumber, location, id];
}
