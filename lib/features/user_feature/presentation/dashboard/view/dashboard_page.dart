import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../app/bloc/app_bloc.dart';
import '../../../../../core/widgets/salamtak_drawer.dart';
import '../../../../medication_feature/domain/repository/medication_repository.dart';
import '../cubit/cubit.dart';
import '../widgets/dashboard_body.dart';
import '../../../../../util/router/screen.dart';

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
    return BlocProvider(
      create: (context) => DashboardCubit(
        medicationRepository: context.read<MedicationRepository>(),
      )..getRequestsAndDonations(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Page'),
          centerTitle: true,
        ),
        body: const DashboardView(),
        drawer: const SalamtakDrawer(),
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (context, state) {
        if (state.status == AppStatus.unauthenticated) {
          context.pushNamed(Screens.login.name);
        }
      },
      child: const DashboardBody(),
    );
  }
}
