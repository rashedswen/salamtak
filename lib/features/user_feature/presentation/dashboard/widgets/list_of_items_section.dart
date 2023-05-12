import 'package:flutter/src/material/progress_indicator.dart';
import 'package:flutter/src/material/refresh_indicator.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/single_child_scroll_view.dart';
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
    return Expanded(
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return RefreshIndicator(
            onRefresh: () async {
              context.read<DashboardCubit>().getRequestsAndDonations();
            },
            child: state is DashboardLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      children: state.medicationItems
                              ?.map(
                                (medication) => MedicationListItem(
                                  medication: medication,
                                ),
                              )
                              .toList() ??
                          [],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
