import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/add_section.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/list_of_items_section.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/widgets/search_section.dart';
import 'package:salamtak/l10n/l10n.dart';
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
    return Stack(
      children: [
        const SalamtakBackground(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.pushNamed(
                          Screens.requestsAndDonationslist.name,
                        );
                      },
                      icon: const Icon(
                        FontAwesomeIcons.sliders,
                        size: 24,
                      ),
                    ),
                  ],
                ),
                const ListOfItemsSection()
              ],
            ),
          ),
        )
      ],
    );
  }
}
