import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/domain/entity/providers.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({
    required AuthenticationRepository authenticationRepository,
    required MedicationRepository medicationRepository,
  })  : _authenticationRepository = authenticationRepository,
        _medicationRepository = medicationRepository,
        super(const ProfileInitial());

  final AuthenticationRepository _authenticationRepository;
  final MedicationRepository _medicationRepository;

  Future<void> getProviders() async {
    final providers = await _authenticationRepository.getProviders();
    emit(state.copyWith(providers: providers));
    _resetState();
  }

  Future<void> getUserRequests() async {
    final userRequests = await _medicationRepository
        .getUserHistory(FirebaseAuth.instance.currentUser!.uid);
    emit(state.copyWith(userRequests: userRequests));
    _resetState();
  }

  Future<void> saveName() async {
    if (state.name == null) return;
    try {
      await _authenticationRepository.changeValue('name', state.name);
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, error: e.toString()));
    }
    _resetState();
  }

  Future<void> savePhoneNumber() async {
    if (state.phoneNumber == null) return;
    try {
      await _authenticationRepository.changeValue(
        'phone_number',
        state.phoneNumber,
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, error: e.toString()));
    }
    _resetState();
  }

  Future<void> saveEmail() async {
    if (state.email == null) return;
    try {
      await _authenticationRepository.changeValue('email', state.email);
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, error: e.toString()));
    }
    _resetState();
  }

  Future<void> saveLocation() async {
    if (state.location == null) return;
    try {
      await _authenticationRepository.changeValue(
        'location',
        state.location?.copyWith(address: state.address).toJson(),
      );
    } catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, error: e.toString()));
    }
    _resetState();
  }

  Future<void> nameChanged(
    String? value,
  ) async {
    emit(state.copyWith(name: value));
  }

  Future<void> phoneNumberChanged(
    String? value,
  ) async {
    emit(state.copyWith(phoneNumber: value));
  }

  Future<void> emailChanged(
    String? value,
  ) async {
    emit(state.copyWith(email: value));
  }

  Future<void> locationChanged(
    LocationSudan? value,
  ) async {
    emit(state.copyWith(location: value));
  }

  Future<void> addressChanged(
    String? value,
  ) async {
    emit(state.copyWith(address: value));
  }

  Future<void> linkWithEmailAndPassword() async {
    if (state.email == null || state.password == null) return;
    try {
      await _authenticationRepository.linkWithEmailAndPassowrd(
        state.email!,
        state.password!,
      );
      emit(state.copyWith(status: ProfileStatus.success));
      await Future.delayed(const Duration(seconds: 1), () {});
      emit(state.copyWith(status: ProfileStatus.initial));
      await getProviders();
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.error));
    }
    _resetState();
  }

  Future<void> linkWithTwitter() async {
    try {
      await _authenticationRepository.linkWithTwitter();
      emit(state.copyWith(status: ProfileStatus.success));
      await Future.delayed(const Duration(seconds: 1), () {});
      emit(state.copyWith(status: ProfileStatus.initial));
      await getProviders();
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.error));
    }
    _resetState();
  }

  Future<void> deleteAccount() async {
    try {
      await _authenticationRepository.deleteAccount();
      emit(state.copyWith(status: ProfileStatus.success));
      await Future.delayed(const Duration(seconds: 1), () {});
      emit(state.copyWith(status: ProfileStatus.initial));
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.error));
    }
    _resetState();
  }

  void _resetState() {
    emit(
      state.copyWith(
        status: ProfileStatus.initial,
      ),
    );
  }
}
