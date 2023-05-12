import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:salamtak/features/user_feature/domain/entity/salamtak_user.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(
          authenticationRepository.currentUser.isEmpty
              ? const AppState.unauthenticated()
              : AppState.authenticated(authenticationRepository.currentUser),
        ) {
    on<_AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);
    _userSubscription = _authenticationRepository.user.listen(
      (user) => add(_AppUserChanged(user)),
    );
  }

  final AuthenticationRepository _authenticationRepository;
  late final StreamSubscription<SalamtakUser> _userSubscription;

  Future<void> _onUserChanged(
    _AppUserChanged event,
    Emitter<AppState> emit,
  ) async {
    final userMod = await _authenticationRepository.getUser();
    final state = event.user.isEmpty
        ? const AppState.unauthenticated()
        : AppState.authenticated(userMod);
    emit(
      state,
    );
  }

  Future<void> _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    unawaited(_authenticationRepository.logOut());
  }

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }
}
