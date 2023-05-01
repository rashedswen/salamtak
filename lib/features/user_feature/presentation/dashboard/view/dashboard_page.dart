import 'package:flutter/material.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/dashboard_body.dart';

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
      create: (context) => DashboardCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard Page'),
        ),
        body: const DashboardView(),
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
