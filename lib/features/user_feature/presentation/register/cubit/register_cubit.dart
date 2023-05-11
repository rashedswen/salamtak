import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../domain/entity/salamtak_user.dart';
import '../../../domain/repository/authentication_repository.dart';
import '../../../util/validators.dart';
import '../../../../../util/json/states_and_cities.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(RegisterInitial(location: LocationSudan.getSudanCities().first));

  final AuthenticationRepository _authenticationRepository;

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(
      state.copyWith(
        name: name,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(
      state.copyWith(
        password: password,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void addressChanged(String value) {
    final address = Address.dirty(value);
    emit(
      state.copyWith(
        address: address,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void locationChanged(LocationSudan value) {
    emit(
      state.copyWith(
        location: value,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  void phoneNumberChanged(String value) {
    final phoneNumber = PhoneNumber.dirty(value);
    emit(
      state.copyWith(
        phoneNumber: phoneNumber,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> signUpWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final user = SalamtakUser(
      id: '',
      email: state.email.value,
      location: state.location?.copyWith(
        address: state.address.value,
      ),
      name: state.name.value,
      phoneNumber: state.phoneNumber.value,
    );
    try {
      await _authenticationRepository.signUpWithEmailAndPassword(
        state.email.value,
        state.password.value,
        user.toModel(),
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
