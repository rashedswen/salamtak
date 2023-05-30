part of 'app_bloc.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  const AppState._({
    this.status = AppStatus.unauthenticated,
    this.user = SalamtakUser.empty,
    this.isDarkMode = false,
  });

  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  const AppState.authenticated(SalamtakUser user)
      : this._(status: AppStatus.authenticated, user: user);

  final AppStatus status;
  final SalamtakUser user;
  final bool isDarkMode;

  AppState copyWith({
    AppStatus? status,
    SalamtakUser? user,
    bool? isDarkMode,
  }) {
    return AppState._(
      status: status ?? this.status,
      user: user ?? this.user,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }

  @override
  List<Object> get props => [status, user];
}
