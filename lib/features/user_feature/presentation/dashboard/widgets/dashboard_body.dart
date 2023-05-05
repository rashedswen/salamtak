import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';
import 'package:salamtak/util/router/screen.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardBody extends StatelessWidget {
  /// {@macro dashboard_body}
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.addRequest.name);
                },
                child: const Text('Add Request'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.addDonation.name);
                },
                child: const Text('Add Donation'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.medication.name);
                },
                child: const Text('Medication page'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.login.name);
                },
                child: const Text('Login page'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.register.name);
                },
                child: const Text('Register page'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.pushNamed(Screens.listOfRequestsDonations.name);
                },
                child: const Text('list of requests donations'),
              ),
            ],
          ),
        );
      },
    );
  }
}
