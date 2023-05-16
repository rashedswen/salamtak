import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/widgets/user_requests_history_body.dart';

/// {@template user_requests_history_page}
/// A description for UserRequestsHistoryPage
/// {@endtemplate}
class UserRequestsHistoryPage extends StatelessWidget {
  /// {@macro user_requests_history_page}
  const UserRequestsHistoryPage({super.key});

  /// The static route for UserRequestsHistoryPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const UserRequestsHistoryPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserRequestsHistoryCubit(
        medicationRepository: context.read<MedicationRepository>(),
      )..getHistory(),
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        body: const UserRequestsHistoryView(),
      ),
    );
  }
}

/// {@template user_requests_history_view}
/// Displays the Body of UserRequestsHistoryView
/// {@endtemplate}
class UserRequestsHistoryView extends StatelessWidget {
  /// {@macro user_requests_history_view}
  const UserRequestsHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return const UserRequestsHistoryBody();
  }
}
