part of 'login_with_phone_number_cubit.dart';

enum LoginWithPhoneNumberSubmitStatus {
  initial,
  success,
  error,
  otpSent,
  loading
}

enum LoginWithPhoneNumberVerificationStatus {
  initial,
  otpSent,
  success,
  error,
  loading
}

class LoginWithPhoneNumberState extends Equatable {
  const LoginWithPhoneNumberState({
    this.phoneNumber = '',
    this.otp = const ['', '', '', '', '', ''],
    this.submitStatus = LoginWithPhoneNumberSubmitStatus.initial,
    this.verificationStatus = LoginWithPhoneNumberVerificationStatus.initial,
  });

  final String phoneNumber;
  final List<String> otp;
  final LoginWithPhoneNumberSubmitStatus submitStatus;
  final LoginWithPhoneNumberVerificationStatus verificationStatus;

  @override
  List<Object?> get props =>
      [phoneNumber, submitStatus, verificationStatus, otp];

  LoginWithPhoneNumberState copyWith({
    String? phoneNumber,
    List<String>? otp,
    LoginWithPhoneNumberSubmitStatus? submitStatus,
    LoginWithPhoneNumberVerificationStatus? verificationStatus,
  }) {
    return LoginWithPhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      otp: otp ?? this.otp,
      submitStatus: submitStatus ?? this.submitStatus,
      verificationStatus: verificationStatus ?? this.verificationStatus,
    );
  }
}

class LoginWithPhoneNumberInitial extends LoginWithPhoneNumberState {
  /// {@macro login_with_phone_number_initial}
  const LoginWithPhoneNumberInitial() : super();
}
