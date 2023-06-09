import 'package:flutter/material.dart';
import '../../../../../core/widgets/salamtak_drawer.dart';
import '../../../domain/repository/medication_repository.dart';
import '../bloc/bloc.dart';
import '../widgets/requests_donations_list_body.dart';

/// {@template requests_donations_list_page}
/// A description for RequestsDonationsListPage
/// {@endtemplate}
class RequestsDonationsListPage extends StatelessWidget {
  /// {@macro requests_donations_list_page}
  const RequestsDonationsListPage({super.key});

  /// The static route for RequestsDonationsListPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const RequestsDonationsListPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestsDonationsListBloc(
        context.read<MedicationRepository>(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Requests Donations List'),
        ),
        drawer: const SalamtakDrawer(),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     context.pushNamed(Screens.addRequest.name);
        //   },
        //   label: const Text('Add Request'),
        // ),
        body: const RequestsDonationsListView(),
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
