import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/admin_feature/domain/repository/admin_medication_repository.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/go_router.dart';

class App extends StatelessWidget {
  const App({
    required MedicationRepository medicationRepository,
    required AuthenticationRepository authenticationRepository,
    required AdminMedicationRepository adminMedicationRepository,
    super.key,
  })  : _medicationRepository = medicationRepository,
        _authenticationRepository = authenticationRepository,
        _adminMedicationRepository = adminMedicationRepository;

  final MedicationRepository _medicationRepository;
  final AuthenticationRepository _authenticationRepository;
  final AdminMedicationRepository _adminMedicationRepository;

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
        RepositoryProvider.value(
          value: _adminMedicationRepository,
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
        useMaterial3: true,
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
        scaffoldBackgroundColor: const Color(0XFFFEF2F4),
        textTheme: GoogleFonts.cairoTextTheme(),
      ),
      
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerDelegate: AppRouter.router.routerDelegate,
      routeInformationParser: AppRouter.router.routeInformationParser,
    );
  }
}
