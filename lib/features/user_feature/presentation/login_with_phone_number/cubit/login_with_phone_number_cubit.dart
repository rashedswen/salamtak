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

  FutureOr<void> phoneNumberChanged(String number) {
    emit(
      state.copyWith(
        phoneNumber: number,
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
          submitStatus: LoginWithPhoneNumberSubmitStatus.otpSent,
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

  Future<void> otpChanged(String otp, int index) async {
    final newOtpList = [...state.otp];
    newOtpList[index] = otp;
    emit(
      state.copyWith(
        otp: newOtpList,
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
        state.otp.join(),
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
