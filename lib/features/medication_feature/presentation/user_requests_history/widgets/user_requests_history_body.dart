import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/presentation/user_requests_history/cubit/cubit.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/router/screen.dart';

/// {@template user_requests_history_body}
/// Body of the UserRequestsHistoryPage.
///
/// Add what it does
/// {@endtemplate}
class UserRequestsHistoryBody extends StatelessWidget {
  /// {@macro user_requests_history_body}
  const UserRequestsHistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRequestsHistoryCubit, UserRequestsHistoryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: state.medicationItems?.map((medication) {
                    final since =
                        DateTime.now().difference(medication.createdDate);
                    return InkWell(
                      onTap: () {
                        context.pushNamed(
                          Screens.medicationDetails.name,
                          extra: medication,
                        );
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: medication.requestType ==
                                    MedicationRequestType.donation
                                ? Colors.green
                                : Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: Row(
                            children: [
                              if (medication.image != null)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    medication.image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              else
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Center(
                                    child:
                                        FaIcon(medication.form.icon, size: 80),
                                  ),
                                ),
                              const SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          medication.name,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          context.l10n.localeName == 'ar'
                                              ? medication.status.arabicName
                                              : medication.status.englishName,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      medication.description.toString(),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // since format is 00:00:00 if it's less than 24 hours ago
                                    // else it's days:hours:minutes
                                    Text(
                                      prettyDuration(
                                        since,
                                        abbreviated: true,
                                        first: true,
                                        locale: DurationLocale.fromLanguageCode(
                                          context.l10n.localeName,
                                        )!,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList() ??
                  [
                    const Text('No Data'),
                  ],
            ),
          ),
        );
      },
    );
  }
}
