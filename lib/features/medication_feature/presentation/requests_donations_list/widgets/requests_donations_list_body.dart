import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/requests_donations_list/bloc/bloc.dart';

/// {@template requests_donations_list_body}
/// Body of the RequestsDonationsListPage.
///
/// Add what it does
/// {@endtemplate}
class RequestsDonationsListBody extends StatefulWidget {
  /// {@macro requests_donations_list_body}
  const RequestsDonationsListBody({super.key});

  @override
  State<RequestsDonationsListBody> createState() =>
      _RequestsDonationsListBodyState();
}

class _RequestsDonationsListBodyState extends State<RequestsDonationsListBody> {
  @override
  void initState() {
    context
        .read<RequestsDonationsListBloc>()
        .add(GetListOfMedicationsRequestDonation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsDonationsListBloc, RequestsDonationsListState>(
      builder: (context, state) {
        return Center(child: Text(state.medicationsList.toString()));
      },
    );
  }
}
