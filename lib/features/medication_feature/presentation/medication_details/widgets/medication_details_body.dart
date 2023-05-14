import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/widgets/medication_details_tab_view.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

/// {@template medication_details_body}
/// Body of the MedicationDetailsPage.
///
/// Add what it does
/// {@endtemplate}
class MedicationDetailsBody extends StatelessWidget {
  /// {@macro medication_details_body}
  const MedicationDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SalamtakBackground(),
        LayoutBuilder(
          builder: (context, constraints) {
            return SafeArea(
              child: SingleChildScrollView(
                child:
                    BlocBuilder<MedicationDetailsCubit, MedicationDetailsState>(
                  builder: (context, state) {
                    final medication = state.medicationItem;
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        minWidth: constraints.maxWidth,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SalamtakAppBar(),
                              SizedBox(
                                height: 200,
                                child: Row(
                                  children: [
                                    Container(
                                      // color: Colors.grey.shade200,
                                      width: 150,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade300,
                                            blurRadius: 4,
                                            offset: const Offset(0, 2),
                                          ),
                                        ],
                                      ),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(8),
                                      child: medication.image != null
                                          ? Image.network(
                                              medication.image!,
                                            )
                                          : FittedBox(
                                              child: FaIcon(
                                                medication.form.icon,
                                                size: 200,
                                              ),
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              medication.name,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            DateFormat(
                                              context.l10n.localeName == 'ar'
                                                  ? 'd MMM ..... HH:MM aa'
                                                  : 'MMM d ..... HH:MM aa',
                                              context.l10n.localeName,
                                            ).format(medication.createdDate),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge
                                                ?.copyWith(
                                                  color: darkGreen,
                                                ),
                                          ),
                                          // type
                                          SizedBox(
                                            width: double.infinity,
                                            child: Chip(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: 8,
                                                horizontal: 32,
                                              ),
                                              label: Text(
                                                medication
                                                    .requestType.arabicName,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      letterSpacing: 1.5,
                                                    ),
                                              ),
                                              backgroundColor:
                                                  medication.requestType.color,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              SizedBox(
                                height: constraints.maxHeight - 500,
                                child: MedicationDetailsTabView(
                                  medicationItem: medication,
                                ),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  BlocBuilder<AppBloc, AppState>(
                                    builder: (context, stateapp) {
                                      return InkWell(
                                        onTap: () {
                                          context
                                              .read<MedicationDetailsCubit>()
                                              .acceptMedicatin(
                                                stateapp.user,
                                              );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                context.l10n
                                                    .request_sent_successfully,
                                              ),
                                              backgroundColor:
                                                  Colors.green.shade400,
                                            ),
                                          );
                                        },
                                        child: ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<MedicationDetailsCubit>()
                                                .acceptMedicatin(
                                                  context
                                                      .read<AppBloc>()
                                                      .state
                                                      .user,
                                                );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: lightGreen,
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8,
                                              horizontal: 32,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(21),
                                            ),
                                          ),
                                          child: Text(
                                            medication.requestType ==
                                                    MedicationRequestType
                                                        .donation
                                                ? context.l10n.i_need_it
                                                : context.l10n.i_can_help,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1.5,
                                                ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
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