import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/enums/medication_form.dart';
import 'package:salamtak/core/enums/medication_request_type.dart';
import 'package:salamtak/features/medication_feature/domain/entity/medication_list.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

class MedicationListItem extends StatelessWidget {
  const MedicationListItem({
    super.key,
    required this.medication,
  });

  final MedicationItem medication;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            context.pushNamed(
              Screens.medicationDetails.name,
              extra: medication,
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
            ),
            child: Row(
              children: [
                if (medication.image != null)
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      child: Image.network(
                        medication.image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                else
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: Center(
                      child: FaIcon(
                        medication.form.icon,
                        size: 50,
                      ),
                    ),
                  ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        medication.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        medication.description ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: medication.requestType.color,
                          borderRadius: BorderRadius.circular(
                            24,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 4,
                          ),
                          child: Text(
                            medication.requestType ==
                                    MedicationRequestType.donation
                                ? context.l10n.donation
                                : context.l10n.request,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(height: 8),
                      // Text(
                      //   prettyDuration(
                      //     DateTime.now().difference(
                      //       medication.createdDate,
                      //     ),
                      //     abbreviated: true,
                      //     locale: DurationLocale.fromLanguageCode(
                      //       context.l10n.localeName,
                      //     )!,
                      //     first: true,
                      //   ),
                      //   style: const TextStyle(
                      //     color: Colors.grey,
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const Icon(
                  FontAwesomeIcons.ellipsisVertical,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey.shade300,
        ),
      ],
    );
  }
}