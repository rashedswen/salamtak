import 'package:flutter/material.dart';
import '../cubit/cubit.dart';

/// {@template admin_dashboard_body}
/// Body of the AdminDashboardPage.
///
/// Add what it does
/// {@endtemplate}
class AdminDashboardBody extends StatelessWidget {
  /// {@macro admin_dashboard_body}
  const AdminDashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminDashboardCubit, AdminDashboardState>(
      builder: (context, state) {
        return Center(child: Text(state.customProperty));
      },
    );
  }
}
