import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:formz/formz.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/features/user_feature/util/errors/login_failure.dart';
import 'package:salamtak/features/user_feature/util/validators.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginInitial());

  final AuthenticationRepository _authenticationRepository;

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

  Future<void> checkIfUserExist() async {
    emit(state.copyWith(emailfounded: Emailfounded.loading));
    final userList = await FirebaseAuth.instance
        .fetchSignInMethodsForEmail(state.email.value);
    if (userList.isEmpty) {
      emit(state.copyWith(emailfounded: Emailfounded.notFound));
    } else {
      emit(
        state.copyWith(
          emailfounded: Emailfounded.found,
        ),
      );
    }
  }

  Future<void> logInWithTwitter() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationRepository.logInWithTwitter();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> logInWithGoogle() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));

    try {
      await _authenticationRepository.logInWithGoogle();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> logInWithApple() async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithApple();
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on Exception {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }

  Future<void> logInWithCredentials() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _authenticationRepository.logInWithEmailAndPassword(
        state.email.value,
        state.password.value,
      );
      emit(state.copyWith(status: FormzSubmissionStatus.success));
    } on LogInWithEmailAndPasswordFailure catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          status: FormzSubmissionStatus.failure,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }
  }
}
