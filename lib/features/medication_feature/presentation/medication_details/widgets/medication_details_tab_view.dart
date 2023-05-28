import 'package:flutter/material.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/domain/entity/entities.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class MedicationDetailsTabView extends StatefulWidget {
  const MedicationDetailsTabView({super.key, required this.medicationItem});

  final MedicationItem medicationItem;

  @override
  State<MedicationDetailsTabView> createState() =>
      _MedicationDetailsTabViewState();
}

class _MedicationDetailsTabViewState extends State<MedicationDetailsTabView>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabViewController = TabController(length: 3, vsync: this);

    return Column(
      children: [
        SizedBox(
          child: TabBar(
            controller: tabViewController,
            indicatorColor: const Color(0xFFD0EFE9),
            labelColor: darkGreen,
            unselectedLabelColor: Theme.of(context).primaryColorLight,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(
                child: FittedBox(
                  child: Text(
                    context.l10n.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    context.l10n.location,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Tab(
                child: FittedBox(
                  child: Text(
                    context.l10n.more_info,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: TabBarView(
            controller: tabViewController,
            children: [
              Card(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.medicationItem.description ??
                        context.l10n.no_description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        widget.medicationItem.location
                                ?.toLocalString(context.l10n.localeName) ??
                            '',
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                color: Theme.of(context).colorScheme.surface,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            context.l10n.level_of_need,
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.medicationItem.emergencyLevel?.arabicName ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Text(
                            context.l10n.medication_type,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.medicationItem.form.arabicName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


// Text(
                              //   medication.name,
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .titleLarge
                              //       ?.copyWith(
                              //         color: Colors.blue.shade700,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              // ),
                              // Text(
                              //   DateFormat(
                              //     context.l10n.localeName == 'ar'
                              //         ? 'd MMM ..... HH:MM aa'
                              //         : 'MMM d ..... HH:MM aa',
                              //     context.l10n.localeName,
                              //   ).format(medication.createdDate),
                              //   style: Theme.of(context)
                              //       .textTheme
                              //       .bodyMedium
                              //       ?.copyWith(
                              //         color: Colors.grey.shade600,
                              //       ),
                              // ),
                              // const SizedBox(
                              //   height: 32,
                              // ),
                              // Row(
                              //   children: [
                              //     FaIcon(
                              //       FontAwesomeIcons.fileLines,
                              //       size: 16,
                              //       color: Colors.blue.shade700,
                              //     ),
                              //     const SizedBox(
                              //       width: 8,
                              //     ),
                              //     Text(
                              //       context.l10n.description,
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .titleSmall
                              //           ?.copyWith(
                              //             color: Colors.blue.shade700,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 16,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // SizedBox(
                              //   width: double.infinity,
                              //   child: Card(
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(8),
                              //       child: Text(
                              //         medication.description ?? '',
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodyMedium,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // Row(
                              //   children: [
                              //     FaIcon(
                              //       FontAwesomeIcons.locationPin,
                              //       size: 16,
                              //       color: Colors.blue.shade700,
                              //     ),
                              //     const SizedBox(
                              //       width: 8,
                              //     ),
                              //     Text(
                              //       context.l10n.location,
                              //       style: Theme.of(context)
                              //           .textTheme
                              //           .titleSmall
                              //           ?.copyWith(
                              //             color: Colors.blue.shade700,
                              //             fontWeight: FontWeight.bold,
                              //             fontSize: 16,
                              //           ),
                              //     ),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // SizedBox(
                              //   width: double.maxFinite,
                              //   child: Card(
                              //     child: Padding(
                              //       padding: const EdgeInsets.all(8),
                              //       child: Text(
                              //         medication.location!.toLocalString(
                              //           context.l10n.localeName,
                              //         ),
                              //         style: Theme.of(context)
                              //             .textTheme
                              //             .bodyMedium,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 16,
                              // ),
                              // if (state.medicationItem.userId !=
                              //     context.read<AppBloc>().state.user.id)
                              //   const Spacer(),
                              // if (state.medicationItem.userId !=
                              //     context.read<AppBloc>().state.user.id)
                              //   Row(
                              //     mainAxisAlignment:
                              //         MainAxisAlignment.spaceAround,
                              //     children: [
                              //       BlocBuilder<AppBloc, AppState>(
                              //         builder: (context, stateapp) {
                              //           return InkWell(
                              //             onTap: () {
                              //               context
                              //                   .read<MedicationDetailsCubit>()
                              //                   .acceptMedicatin(
                              //                     stateapp.user,
                              //                   );
                              //               ScaffoldMessenger.of(context)
                              //                   .showSnackBar(
                              //                 SnackBar(
                              //                   content: Text(
                              //                     context.l10n
                              //                         .request_sent_successfully,
                              //                   ),
                              //                   backgroundColor:
                              //                       Colors.green.shade400,
                              //                 ),
                              //               );
                              //             },
                              //             child: Container(
                              //               padding: const EdgeInsets.symmetric(
                              //                 horizontal: 16,
                              //                 vertical: 8,
                              //               ),
                              //               color: Colors.green.shade50,
                              //               child: Column(
                              //                 children: [
                              //                   const FaIcon(
                              //                     FontAwesomeIcons.circleCheck,
                              //                     size: 32,
                              //                     color: Colors.green,
                              //                   ),
                              //                   const SizedBox(
                              //                     height: 8,
                              //                   ),
                              //                   if (medication.requestType ==
                              //                       MedicationRequestType
                              //                           .donation)
                              //                     Text(context.l10n.i_need_it)
                              //                   else
                              //                     Text(context.l10n.i_can_help)
                              //                 ],
                              //               ),
                              //             ),
                              //           );
                              //         },
                              //       ),
                              //       // Todo(report) : report medication or user
                              //       // Container(
                              //       //   padding: const EdgeInsets.symmetric(
                              //       //     horizontal: 16,
                              //       //     vertical: 8,
                              //       //   ),
                              //       //   // color: Colors.red  .shade50,
                              //       //   child: Column(
                              //       //     children: [
                              //       //       const FaIcon(
                              //       //         FontAwesomeIcons.warning,
                              //       //         size: 32,
                              //       //         color: Colors.red,
                              //       //       ),
                              //       //       const SizedBox(
                              //       //         height: 8,
                              //       //       ),
                              //       //       Text(context.l10n.report)
                              //       //     ],
                              //       //   ),
                              //       // ),
                              //     ],
                              //   ),
                              // if (state.medicationItem.userId ==
                              //     context.read<AppBloc>().state.user.id)
                              //   Expanded(
                              //     child: Column(
                              //       children: [
                              //         Row(
                              //           children: [
                              //             FaIcon(
                              //               FontAwesomeIcons.users,
                              //               size: 16,
                              //               color: Colors.blue.shade700,
                              //             ),
                              //             const SizedBox(
                              //               width: 8,
                              //             ),
                              //             Text(
                              //               medication.requestType ==
                              //                       MedicationRequestType
                              //                           .donation
                              //                   ? context.l10n.needers
                              //                   : context.l10n.helpers,
                              //               style: Theme.of(context)
                              //                   .textTheme
                              //                   .titleSmall
                              //                   ?.copyWith(
                              //                     color: Colors.blue.shade700,
                              //                     fontWeight: FontWeight.bold,
                              //                     fontSize: 16,
                              //                   ),
                              //             ),
                              //           ],
                              //         ),
                              //         Expanded(
                              //           child: Card(
                              //             child: SingleChildScrollView(
                              //               child: BlocBuilder<
                              //                   MedicationDetailsCubit,
                              //                   MedicationDetailsState>(
                              //                 builder: (context, stateList) {
                              //                   if (stateList.usersListStatus ==
                              //                       MedicationDetailsUsersListStatus
                              //                           .loading) {
                              //                     return const Center(
                              //                       child:
                              //                           CircularProgressIndicator(),
                              //                     );
                              //                   }
                              //                   if (stateList.usersListStatus ==
                              //                       MedicationDetailsUsersListStatus
                              //                           .loaded) {
                              //                     if (stateList
                              //                         .usersAcceptedRequest!
                              //                         .isEmpty) {
                              //                       return Center(
                              //                         child: Text(
                              //                           context.l10n
                              //                               .the_request_was_not_accepted_by_any_user,
                              //                           style: Theme.of(context)
                              //                               .textTheme
                              //                               .bodyMedium,
                              //                         ),
                              //                       );
                              //                     } else {
                              //                       return Column(
                              //                         children: state
                              //                                 .usersAcceptedRequest
                              //                                 ?.map(
                              //                                   (e) => ListTile(
                              //                                     leading:
                              //                                         const Icon(
                              //                                       Icons
                              //                                           .check_circle,
                              //                                       color: Colors
                              //                                           .green,
                              //                                     ),
                              //                                     title: Text(
                              //                                       e.name ??
                              //                                           '',
                              //                                     ),
                              //                                     // subtitle: Text(
                              //                                     //   e.location?.toLocalString(
                              //                                     //         context.l10n
                              //                                     //             .localeName,
                              //                                     //       ) ??
                              //                                     //       '',
                              //                                     // ),
                              //                                     subtitle:
                              //                                         Text(
                              //                                       e.phoneNumber ??
                              //                                           '',
                              //                                     ),
                              //                                   ),
                              //                                 )
                              //                                 .toList() ??
                              //                             [],
                              //                       );
                              //                     }
                              //                   }
                              //                   return const SizedBox(
                              //                     child: Text('error'),
                              //                   );
                              //                 },
                              //               ),
                              //             ),
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ),