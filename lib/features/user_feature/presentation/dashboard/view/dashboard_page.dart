import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_drawer.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/domain/repository/authentication_repository.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/dashboard_body.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/web/dashboard_web_body.dart';
import 'package:salamtak/features/user_feature/presentation/profile/cubit/cubit.dart';
import 'package:salamtak/util/layout/responsive_layout.dart';

/// {@template dashboard_page}
/// A description for DashboardPage
/// {@endtemplate}
class DashboardPage extends StatelessWidget {
  /// {@macro dashboard_page}
  const DashboardPage({super.key});

  /// The static route for DashboardPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DashboardCubit(
            medicationRepository: context.read<MedicationRepository>(),
          )..getRequestsAndDonations(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(
            authenticationRepository: context.read<AuthenticationRepository>(),
            medicationRepository: context.read<MedicationRepository>(),
          ),
        ),
      ],
      child: const Scaffold(
        body: DashboardView(),
        drawer: SalamtakDrawer(),
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.status == ProfileStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error ?? 'An unknown error occured'),
            ),
          );
        }
      },
      child: const ResponsiveLayout(
        mobileBody: DashboardBodyMobile(),
        tabletBody: DashboardBodyMobile(),
        webBody: DashboardWebBody(),
      ),
    );
  }
}
