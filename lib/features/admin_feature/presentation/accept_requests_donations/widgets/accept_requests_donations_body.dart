import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../core/enums/enums.dart';
import '../../../domain/repository/admin_medication_repository.dart';
import '../cubit/cubit.dart';
import '../../../../../l10n/l10n.dart';

/// Get List of Medications and Accept Requests Donations Body
///
class AcceptRequestsDonationsBody extends StatelessWidget {
  const AcceptRequestsDonationsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<AcceptRequestsDonationsCubit,
          AcceptRequestsDonationsState>(
        builder: (blocContext, state) {
          if (state is AcceptRequestsDonationsLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AcceptRequestsDonationsLoaded) {
            return LayoutBuilder(
              builder: (layoutContext, constartint) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          context.l10n.medications,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          '${context.l10n.total}: ${state.medicationsList.length}',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: constartint.maxHeight * 0.9,
                      child: SingleChildScrollView(
                        child: Column(
                          children: state.medicationsList
                              .map(
                                (medication) => InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (_) {
                                        return BlocProvider(
                                          create: (_) =>
                                              AcceptRequestsDonationsCubit(
                                            adminMedicationRepository:
                                                context.read<
                                                    AdminMedicationRepository>(),
                                          ),
                                          child: AlertDialog(
                                            title: Text(
                                              context.l10n.medication_details,
                                            ),
                                            content: SingleChildScrollView(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${context.l10n.name}: ${medication.name}',
                                                  ),
                                                  const SizedBox(height: 8),

                                                  Text(
                                                    '${context.l10n.description}: ${medication.description}',
                                                  ),
                                                  const SizedBox(height: 8),

                                                  Text(
                                                    '${context.l10n.status}: ${context.l10n.localeName == 'ar' ? medication.status.arabicName : medication.status.englishName}',
                                                  ),
                                                  const SizedBox(height: 8),
                                                  Text(
                                                    '${context.l10n.request_type}: ${context.l10n.localeName == 'ar' ? medication.requestType.arabicName : medication.requestType.englishName}',
                                                  ),
                                                  const SizedBox(height: 8),

                                                  Text(
                                                    '${context.l10n.created_date}: ${medication.createdDate}',
                                                  ),
                                                  const SizedBox(height: 8),
                                                  // Text(
                                                  //   '${context.l10n.image}: ${medication.image}',
                                                  // ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          AcceptRequestsDonationsCubit>()
                                                      .acceptMedication(
                                                        medication,
                                                      );
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    Text(context.l10n.accept),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<
                                                          AcceptRequestsDonationsCubit>()
                                                      .rejectMedication(
                                                        medication,
                                                        '',
                                                      );
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    Text(context.l10n.reject),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    Text(context.l10n.cancel),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          if (medication.image != null)
                                            Image.network(
                                              medication.image!,
                                              width: 50,
                                              height: 50,
                                              fit: BoxFit.cover,
                                            )
                                          else
                                            FaIcon(
                                              medication.form.icon,
                                              size: 50,
                                            ),
                                          const SizedBox(width: 16),
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      medication.name,
                                                      style: const TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      context.l10n.localeName ==
                                                              'ar'
                                                          ? medication
                                                              .status.arabicName
                                                          : medication.status
                                                              .englishName,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  medication.description ?? '',
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      prettyDuration(
                                                        DateTime.now()
                                                            .difference(
                                                          medication
                                                              .createdDate,
                                                        ),
                                                        locale: context.l10n
                                                                    .localeName ==
                                                                'ar'
                                                            ? const ArabicDurationLocale()
                                                            : const EnglishDurationLocale(),
                                                        first: true,
                                                      ),
                                                    ),
                                                    const SizedBox(width: 8),
                                                    Text(
                                                      context.l10n.localeName ==
                                                              'ar'
                                                          ? medication
                                                              .requestType
                                                              .arabicName
                                                          : medication
                                                              .requestType
                                                              .englishName,
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
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
                              .toList(),
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: Text('No Medications Found'));
        },
      ),
    );
  }
}
