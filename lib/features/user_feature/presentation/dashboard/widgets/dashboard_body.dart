import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/add_section.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/list_of_items_section.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/search_section.dart';
import 'package:salamtak/l10n/l10n.dart';

/// {@template dashboard_body}
/// Body of the DashboardPage.
///
/// Add what it does
/// {@endtemplate}
class DashboardBodyMobile extends StatelessWidget {
  /// {@macro dashboard_body}
  const DashboardBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SalamtakBackground(),
        Positioned.fill(
          child: SafeArea(
            child: LayoutBuilder(
              builder: (context, constrain) {
                return SingleChildScrollView(
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          const SalamtakAppBar(),
                          const SizedBox(height: 16),
                          const SizedBox(
                            height: 210,
                            child: AddSection(),
                          ),
                          const SizedBox(height: 16),
                          const SearchSection(),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              Text(
                                context.l10n.recent_requests_and_donations,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                              // const Spacer(),
                              // IconButton(
                              //   onPressed: () {
                              //     context.pushNamed(
                              //       Screens.requestsAndDonationslist.name,
                              //     );
                              //   },
                              //   icon: const Icon(
                              //     FontAwesomeIcons.sliders,
                              //     size: 24,
                              //   ),
                              // ),
                            ],
                          ),
                          const ListOfItemsSection()
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
