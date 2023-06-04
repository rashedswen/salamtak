import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/widgets/location_section.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/core/widgets/web_widgets/web_add_item_row.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_info.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/select_image.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

/// {@template add_donation_body}
/// Body of the AddDonationPage.
///
/// Add what it does
/// {@endtemplate}
class AddDonationWebBody extends StatelessWidget {
  /// {@macro add_donation_body}
  const AddDonationWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<AppBloc>().state.status == AppStatus.authenticated
        ? Stack(
            children: [
              const SalamtakBackground(),
              SafeArea(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 128),
                      child: BlocBuilder<AddDonationCubit, AddDonationState>(
                        builder: (context, state) {
                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              minHeight: constraints.maxHeight,
                              minWidth: constraints.maxWidth,
                            ),
                            child: IntrinsicHeight(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  const SalamtakAppBar(),
                                  const SizedBox(height: 32),
                                  const WebAddItemRow(),
                                  const SizedBox(height: 32),
                                  Expanded(
                                    child: Card(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 32,
                                          vertical: 16,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  TextWithField(
                                                    text: context
                                                        .l10n.medication_name,
                                                    onChanged: (String value) =>
                                                        context
                                                            .read<
                                                                AddDonationCubit>()
                                                            .nameChanged(value),
                                                  ),
                                                  const SizedBox(height: 32),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextWithField(
                                                          text: context.l10n
                                                              .medication_quantity,
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          onChanged: (
                                                            String value,
                                                          ) =>
                                                              context
                                                                  .read<
                                                                      AddDonationCubit>()
                                                                  .quantityChanged(
                                                                    value,
                                                                  ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 16),
                                                      Expanded(
                                                        child: TextWithField(
                                                          value:
                                                              state.expiredAt ==
                                                                      null
                                                                  ? ''
                                                                  : DateFormat(
                                                                      'y/M/d',
                                                                    ).format(
                                                                      state
                                                                          .expiredAt!,
                                                                    ),
                                                          text: context.l10n
                                                              .medication_expiry_date,
                                                          onTap: () {
                                                            showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime
                                                                      .now(),
                                                              lastDate:
                                                                  DateTime.now()
                                                                      .add(
                                                                const Duration(
                                                                  days: 365,
                                                                ),
                                                              ),
                                                            ).then(
                                                              (value) => context
                                                                  .read<
                                                                      AddDonationCubit>()
                                                                  .expiredAtChanged(
                                                                    value!,
                                                                  ),
                                                            );
                                                          },
                                                          onChanged: (
                                                            String value,
                                                          ) =>
                                                              context
                                                                  .read<
                                                                      AddDonationCubit>()
                                                                  .expiredAtChanged(
                                                                    DateTime(
                                                                      int.parse(
                                                                        value,
                                                                      ),
                                                                    ),
                                                                  ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 32),
                                                  TextWithField(
                                                    text: context
                                                        .l10n.extra_description,
                                                    maxLines: 6,
                                                    onChanged: (String value) =>
                                                        context
                                                            .read<
                                                                AddDonationCubit>()
                                                            .descriptionChanged(
                                                              value,
                                                            ),
                                                  ),
                                                  const SizedBox(height: 32),
                                                  SelectImage(
                                                    title: context
                                                        .l10n.medication_image,
                                                    image: state.imageUrl,
                                                    onImageChanged: (
                                                      PlatformFile value,
                                                    ) =>
                                                        context
                                                            .read<
                                                                AddDonationCubit>()
                                                            .imageChanged(
                                                              value,
                                                            ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                  // location dropdown
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 32),
                                            Expanded(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        8,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                          blurRadius: 12,
                                                          offset: const Offset(
                                                            0,
                                                            3,
                                                          ),
                                                        ),
                                                      ],
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .tertiary,
                                                    ),
                                                    child: Wrap(
                                                      alignment:
                                                          WrapAlignment.center,
                                                      spacing: 8,
                                                      children: medicineFormList
                                                          .map(
                                                            (item) =>
                                                                MedicationFormCard(
                                                              form: item.form,
                                                              onSelect: () => context
                                                                  .read<
                                                                      AddDonationCubit>()
                                                                  .formChanged(
                                                                    item.form,
                                                                  ),
                                                              icon: item.icon,
                                                              color: item.color,
                                                              isSelected:
                                                                  state.form ==
                                                                      item.form,
                                                            ),
                                                          )
                                                          .toList(),
                                                    ),
                                                  ),
                                                  LocationSection(
                                                    selectedLocation:
                                                        state.location,
                                                    selectedAddress:
                                                        state.address,
                                                    onAddressChanged: (
                                                      String value,
                                                    ) =>
                                                        context
                                                            .read<
                                                                AddDonationCubit>()
                                                            .addressChanged(
                                                              value,
                                                            ),
                                                    onLocationChanged: (
                                                      LocationSudan value,
                                                    ) =>
                                                        context
                                                            .read<
                                                                AddDonationCubit>()
                                                            .locationChanged(
                                                              value,
                                                            ),
                                                  ),
                                                  const SizedBox(
                                                    height: 16,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Align(
                                    child: SizedBox(
                                      width: 100,
                                      child: SalamtakButton(
                                        onTap: () {
                                          context
                                              .read<AddDonationCubit>()
                                              .addDonation();
                                        },
                                        text: context.l10n.donation,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : const LoginToContinueWidget();
  }

  Future<PlatformFile?> selectImage() async {
    final pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (pickedFile != null) {
      final s = pickedFile.files.first;
      return s;
    }
    return null;
  }
}
