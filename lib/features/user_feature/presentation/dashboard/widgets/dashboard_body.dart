import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/user_feature/presentation/dashboard/cubit/cubit.dart';
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
    return BlocBuilder<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(
                          Screens.addDonation.name,
                        );
                      },
                      child: Card(
                        color: Colors.blue.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.handHoldingMedical,
                                size: 100,
                              ),
                              const SizedBox(height: 16),
                              Text(context.l10n.add_donation),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        context.pushNamed(
                          Screens.addRequest.name,
                        );
                      },
                      child: Card(
                        color: Colors.blue.shade100,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.tablets,
                                size: 100,
                              ),
                              const SizedBox(height: 16),
                              Text(context.l10n.add_request),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(
                    context.l10n.recent_requests_and_donations,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      context.pushNamed(
                        Screens.requestsAndDonationslist.name,
                      );
                    },
                    child: Text(context.l10n.view_all),
                  ),
                ],
              ),
              Expanded(
                child: RefreshIndicator(
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
                                      (e) => InkWell(
                                        onTap: () {
                                          context.pushNamed(
                                            Screens.medicationDetails.name,
                                            extra: e,
                                          );
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                              color: e.requestType ==
                                                      MedicationRequestType
                                                          .donation
                                                  ? Colors.green
                                                  : Colors.red,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          elevation: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 8,
                                            ),
                                            child: Row(
                                              children: [
                                                if (e.image != null)
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      8,
                                                    ),
                                                    child: Image.network(
                                                      e.image!,
                                                      width: 100,
                                                      height: 100,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                else
                                                  const FaIcon(
                                                    FontAwesomeIcons.tablets,
                                                    size: 50,
                                                  ),
                                                const SizedBox(width: 16),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            e.name,
                                                            style:
                                                                const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            prettyDuration(
                                                              DateTime.now()
                                                                  .difference(
                                                                e.createdDate,
                                                              ),
                                                              abbreviated: true,
                                                              locale: DurationLocale
                                                                  .fromLanguageCode(
                                                                context.l10n
                                                                    .localeName,
                                                              )!,
                                                              first: true,
                                                            ),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        e.description ?? '',
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        e.requestType ==
                                                                MedicationRequestType
                                                                    .donation
                                                            ? context
                                                                .l10n.donation
                                                            : context
                                                                .l10n.request,
                                                        style: TextStyle(
                                                          color: e.requestType ==
                                                                  MedicationRequestType
                                                                      .donation
                                                              ? Colors.green
                                                              : Colors.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                    .toList() ??
                                [],
                          ),
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
