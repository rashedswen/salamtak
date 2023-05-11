import 'package:equatable/equatable.dart';
import '../../../../util/json/states_and_cities.dart';

class UsersAcceptedRequests extends Equatable {
  const UsersAcceptedRequests({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.location,
  });

  final String? id;
  final String? name;
  final String? phoneNumber;
  final LocationSudan? location;

  @override
  List<Object?> get props => [id, name, phoneNumber, location];
}
