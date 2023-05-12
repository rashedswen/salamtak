import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
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
                              const MedicationDetailsTabView(),
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
