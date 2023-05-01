import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/domain/repository/medication_repository.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/bloc/bloc.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/widgets/requests_donations_list_body.dart';

/// {@template requests_donations_list_page}
/// A description for RequestsDonationsListPage
/// {@endtemplate}
class RequestsDonationsListPage extends StatelessWidget {
  /// {@macro requests_donations_list_page}
  const RequestsDonationsListPage({super.key});

  /// The static route for RequestsDonationsListPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const RequestsDonationsListPage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestsDonationsListBloc(
        context.read<MedicationRepository>(),
      ),
      child: const Scaffold(
        body: RequestsDonationsListView(),
      ),
    );
  }    
}

/// {@template requests_donations_list_view}
/// Displays the Body of RequestsDonationsListView
/// {@endtemplate}
class RequestsDonationsListView extends StatelessWidget {
  /// {@macro requests_donations_list_view}
  const RequestsDonationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const RequestsDonationsListBody();
  }
}
