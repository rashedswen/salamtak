import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/presentation/medication_details/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: BlocBuilder<MedicationDetailsCubit, MedicationDetailsState>(
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
                        if (medication.image != null)
                          Image.network(
                            medication.image!,
                            width: 200,
                            height: 200,
                          )
                        else
                          FaIcon(
                            medication.form.icon,
                            size: 200,
                          ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          medication.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          context.l10n.description,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          medication.description ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          context.l10n.location,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          medication.location!
                              .toLocalString(context.l10n.localeName),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        if (state.medicationItem.userId !=
                            context.read<AppBloc>().state.user.id)
                          const Spacer(),
                        if (state.medicationItem.userId !=
                            context.read<AppBloc>().state.user.id)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                            context
                                                .l10n.request_sent_successfully,
                                          ),
                                          backgroundColor:
                                              Colors.green.shade400,
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16,
                                        vertical: 8,
                                      ),
                                      color: Colors.green.shade50,
                                      child: Column(
                                        children: [
                                          const FaIcon(
                                            FontAwesomeIcons.circleCheck,
                                            size: 32,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          if (medication.requestType ==
                                              MedicationRequestType.donation)
                                            Text(context.l10n.i_need_it)
                                          else
                                            Text(context.l10n.i_can_help)
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                              // Todo(report) : report medication or user
                              // Container(
                              //   padding: const EdgeInsets.symmetric(
                              //     horizontal: 16,
                              //     vertical: 8,
                              //   ),
                              //   // color: Colors.red  .shade50,
                              //   child: Column(
                              //     children: [
                              //       const FaIcon(
                              //         FontAwesomeIcons.warning,
                              //         size: 32,
                              //         color: Colors.red,
                              //       ),
                              //       const SizedBox(
                              //         height: 8,
                              //       ),
                              //       Text(context.l10n.report)
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                        if (state.medicationItem.userId ==
                            context.read<AppBloc>().state.user.id)
                          Expanded(
                            child: Card(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: const [
                                    ListTile(
                                      leading: FaIcon(
                                        FontAwesomeIcons.circleCheck,
                                        color: Colors.green,
                                      ),
                                      title: Text('Ahmed'),
                                      subtitle: Text('I need it'),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
