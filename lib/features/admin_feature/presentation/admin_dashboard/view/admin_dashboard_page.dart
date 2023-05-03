import 'package:flutter/material.dart';
import 'package:salamtak/features/admin_feature/presentation/admin_dashboard/cubit/cubit.dart';
import 'package:salamtak/features/admin_feature/presentation/admin_dashboard/widgets/admin_dashboard_body.dart';

/// {@template admin_dashboard_page}
/// A description for AdminDashboardPage
/// {@endtemplate}
class AdminDashboardPage extends StatelessWidget {
  /// {@macro admin_dashboard_page}
  const AdminDashboardPage({super.key});

  /// The static route for AdminDashboardPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const AdminDashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminDashboardCubit(),
      child: const Scaffold(
        body: AdminDashboardView(),
      ),
    );
  }    
}

/// {@template admin_dashboard_view}
/// Displays the Body of AdminDashboardView
/// {@endtemplate}
class AdminDashboardView extends StatelessWidget {
  /// {@macro admin_dashboard_view}
  const AdminDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return const AdminDashboardBody();
  }
}
