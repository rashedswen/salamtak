import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
part 'login_with_phone_number_state.dart';

class LoginWithPhoneNumberCubit extends Cubit<LoginWithPhoneNumberState> {
  LoginWithPhoneNumberCubit({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginWithPhoneNumberInitial());

  final AuthenticationRepository _authenticationRepository;

  FutureOr<void> numberAdded(String number) {
    final newNumber = state.phoneNumber + number;
    emit(
      state.copyWith(
        phoneNumber: newNumber,
      ),
    );
  }

  FutureOr<void> numberDeleted() {
    final newNumber = state.phoneNumber.substring(
      0,
      state.phoneNumber.length - 1,
    );
    emit(
      state.copyWith(
        phoneNumber: newNumber,
      ),
    );
  }

  Future<void> loginWithPhoneNumber() async {
    emit(
      state.copyWith(
        submitStatus: LoginWithPhoneNumberSubmitStatus.loading,
      ),
    );
    try {
      // add + to the number
      final phoneNumber = '+${state.phoneNumber}';
      await _authenticationRepository.loginWithPhoneNumber(
        phoneNumber,
      );
      emit(
        state.copyWith(
          submitStatus: LoginWithPhoneNumberSubmitStatus.success,
          phoneNumber: '',
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          submitStatus: LoginWithPhoneNumberSubmitStatus.error,
        ),
      );
    }
  }

  Future<void> otpChanged(String otp) async {
    final newOtp = state.otp + otp;
    emit(
      state.copyWith(
        otp: newOtp,
      ),
    );
  }

  Future<void> otpDeleted() async {
    final newOtp = state.otp.substring(
      0,
      state.otp.length - 1,
    );
    emit(
      state.copyWith(
        otp: newOtp,
      ),
    );
  }

  Future<void> verifyOtp() async {
    emit(
      state.copyWith(
        verificationStatus: LoginWithPhoneNumberVerificationStatus.loading,
      ),
    );
    try {
      await _authenticationRepository.verifyPhoneNumber(
        state.otp,
      );
      emit(
        state.copyWith(
          verificationStatus: LoginWithPhoneNumberVerificationStatus.success,
        ),
      );
    } on Exception {
      emit(
        state.copyWith(
          verificationStatus: LoginWithPhoneNumberVerificationStatus.error,
        ),
      );
    }
  }
}
