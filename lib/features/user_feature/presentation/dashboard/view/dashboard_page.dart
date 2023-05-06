import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/dashboard_body.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

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
        drawer: Drawer(
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      minWidth: constraints.maxWidth,
                    ),
                    child: IntrinsicHeight(
                      child: Column(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.home),
                            title: Text(context.l10n.home),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const Icon(Icons.settings),
                            title: Text(context.l10n.settings),
                            onTap: () {},
                          ),
                          const Spacer(),
                          // if (context
                          //         .read<AppBloc>()
                          //         .state
                          //         .user
                          //         .authorization ==
                          //     'admin')
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.userShield),
                            title: Text(context.l10n.adminPanel),
                            onTap: () {
                              context.pushNamed(
                                Screens.approveMedicationsRequests.name,
                              );
                            },
                          ),
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.circleUser),
                            title: Text(context.l10n.profile),
                            onTap: () {},
                          ),
                          ListTile(
                            leading:
                                const Icon(Icons.logout, color: Colors.red),
                            title: Text(
                              context.l10n.logout,
                              style: const TextStyle(color: Colors.red),
                            ),
                            onTap: () {
                              context.read<AppBloc>().add(AppLogoutRequested());
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const DashboardBody();
  }
}
