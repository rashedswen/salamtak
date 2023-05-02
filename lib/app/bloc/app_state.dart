part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState._({
    this.status = AppStatus.unauthenticated,
    this.user = SalamtakUser.empty,
  });

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.authenticated(SalamtakUser user)
      : this._(status: AppStatus.authenticated, user: user);

  final AppStatus status;
  final SalamtakUser user;

  @override
  List<Object> get props => [status, user];
}
