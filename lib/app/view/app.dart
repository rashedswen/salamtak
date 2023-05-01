import 'package:flutter/material.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/go_router.dart';

class App extends StatelessWidget {
  const App({
    required MedicationRepository medicationRepository,
    required AuthenticationRepository authenticationRepository,
    super.key,
  })  : _medicationRepository = medicationRepository,
        _authenticationRepository = authenticationRepository;

  final MedicationRepository _medicationRepository;
  final AuthenticationRepository _authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(
          value: _medicationRepository,
        ),
        RepositoryProvider.value(
          value: _authenticationRepository,
        ),
      ],
      child: BlocProvider(
        create: (context) => AppBloc(
          authenticationRepository: _authenticationRepository,
        ),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        scaffoldBackgroundColor: const Color(0XFFFEF2F4),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
