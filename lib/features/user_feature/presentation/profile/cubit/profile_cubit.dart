import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/util/json/states_and_cities.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const ProfileInitial());

  final AuthenticationRepository _authenticationRepository;

  Future<void> nameChanged(String value, SalamtakUser user) async {
    await _authenticationRepository.changeValue('name', value);
  }

  Future<void> phoneNumberChanged(String value, SalamtakUser user) async {
    await _authenticationRepository.changeValue('phone_number', value);
  }

  Future<void> locationChanged(LocationSudan value, SalamtakUser user) async {
    await _authenticationRepository.changeValue('location', value.toJson());
  }
}
