import 'package:duration/duration.dart';
import 'package:duration/locale.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/enums/enums.dart';
import '../bloc/bloc.dart';
import '../../../../../l10n/l10n.dart';
import '../../../../../util/router/screen.dart';

/// {@template requests_donations_list_body}
/// Body of the RequestsDonationsListPage.
///
/// Add what it does
/// {@endtemplate}
class RequestsDonationsListBody extends StatefulWidget {
  /// {@macro requests_donations_list_body}
  const RequestsDonationsListBody({super.key});

  @override
  State<RequestsDonationsListBody> createState() =>
      _RequestsDonationsListBodyState();
}

class _RequestsDonationsListBodyState extends State<RequestsDonationsListBody> {
  @override
  void initState() {
    context
        .read<RequestsDonationsListBloc>()
        .add(GetListOfMedicationsRequestDonation());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsDonationsListBloc, RequestsDonationsListState>(
      builder: (context, state) {
        return state.status == RequestsDonationsListStatus.loaded
            ? Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.builder(
                  itemCount: state.medicationsList.length,
                  itemBuilder: (context, index) {
                    final medication = state.medicationsList[index];
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
                          padding: const EdgeInsets.all(8),
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
                                    Text(
                                      medication.name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
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
                  },
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }
}
