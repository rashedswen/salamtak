import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_builder.dart';
import 'package:provider/src/provider.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/dashboard_cubit.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/medication_list_item.dart';

class ListOfItemsSection extends StatelessWidget {
  const ListOfItemsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: () async {
            context.read<DashboardCubit>().getRequestsAndDonations();
          },
          child: state is DashboardLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    // const Row(
                    //   children: [
                    //     // const Spacer(),
                    //     // IconButton(
                    //     //   onPressed: () {
                    //     //     context.pushNamed(
                    //     //       Screens.requestsAndDonationslist.name,
                    //     //     );
                    //     //   },
                    //     //   icon: const Icon(
                    //     //     FontAwesomeIcons.sliders,
                    //     //     size: 24,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    Column(
                      children: state.medicationItems
                              ?.map(
                                (medication) => MedicationListItem(
                                  medication: medication,
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
