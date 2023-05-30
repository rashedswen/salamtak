part of 'login_cubit.dart';

enum LoginStatus { initial, loading, success, error }

enum Emailfounded { initial, found, notFound, loading }

class LoginState extends Equatable with FormzMixin {
  const LoginState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.errorMessage,
    this.loginStatus = LoginStatus.initial,
    this.emailfounded = Emailfounded.initial,
  });

  final Email email;
  final Password password;
  final FormzSubmissionStatus status;
  final String? errorMessage;
  final LoginStatus loginStatus;
  final Emailfounded emailfounded;

  @override
  List<Object?> get props =>
      [email, password, status, errorMessage, loginStatus, emailfounded];

  LoginState copyWith(
      {Email? email,
      Password? password,
      FormzSubmissionStatus? status,
      String? errorMessage,
      LoginStatus? loginStatus,
      Emailfounded? emailfounded,}) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        loginStatus: loginStatus ?? this.loginStatus,
        emailfounded: emailfounded ?? this.emailfounded,);
  }

  @override
  // TODO: implement inputs
  List<FormzInput> get inputs => [email, password];
}

/// {@template login_initial}
/// The initial state of LoginState
/// {@endtemplate}
class LoginInitial extends LoginState {
  /// {@macro login_initial}
  const LoginInitial() : super();
}
