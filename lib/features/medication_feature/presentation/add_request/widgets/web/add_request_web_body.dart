import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/location_section.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/core/widgets/web_widgets/web_add_item_row.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/widgets.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/emergency_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_info.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/select_image.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

/// {@template add_request_body}
/// Body of the AddRequestPage.
///
/// Add what it does
/// {@endtemplate}
class AddRequestWebBody extends StatelessWidget {
  /// {@macro add_request_body}
  const AddRequestWebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<AppBloc>().state.status == AppStatus.authenticated
        ? Stack(
            children: [
              const SalamtakBackground(),
              LayoutBuilder(
                builder: (context, constraints) {
                  return SafeArea(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 128),
                      child: BlocBuilder<AddRequestCubit, AddRequestState>(
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
                                  Card(
                                    color: lemon,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 32,
                                        vertical: 16,
                                      ),
                                      child: Row(
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
                                                              AddRequestCubit>()
                                                          .nameChanged(value),
                                                ),
                                                const SizedBox(height: 16),
                                                const SizedBox(height: 16),
                                                TextWithField(
                                                  text: context
                                                      .l10n.extra_description,
                                                  maxLines: 6,
                                                  onChanged: (String value) =>
                                                      context
                                                          .read<
                                                              AddRequestCubit>()
                                                          .descriptionChanged(
                                                              value),
                                                ),
                                                const SizedBox(height: 16),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: SelectImage(
                                                        title: context.l10n
                                                            .medication_image,
                                                        image: state.image,
                                                        onImageChanged: (
                                                          PlatformFile value,
                                                        ) =>
                                                            context
                                                                .read<
                                                                    AddRequestCubit>()
                                                                .imageChanged(
                                                                    value),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 16),
                                                    Expanded(
                                                      child: SelectImage(
                                                        title: context.l10n
                                                            .prescription_image,
                                                        image:
                                                            state.prescription,
                                                        onImageChanged:
                                                            (PlatformFile
                                                                value) {
                                                          context
                                                              .read<
                                                                  AddRequestCubit>()
                                                              .prescriptionChanged(
                                                                value,
                                                              );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 64),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: DecoratedBox(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade300,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(0.3),
                                                          blurRadius: 12,
                                                          offset: const Offset(
                                                              0, 3),
                                                        ),
                                                      ],
                                                      color: lemon,
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
                                                                      AddRequestCubit>()
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
                                                ),
                                                const SizedBox(height: 16),
                                                EmergencySection(
                                                  selectedLevel:
                                                      state.emergencyLevel,
                                                  onTap: (EmergencyLevel
                                                          value) =>
                                                      context
                                                          .read<
                                                              AddRequestCubit>()
                                                          .emergencyLevelChanged(
                                                            value,
                                                          ),
                                                ),
                                                const SizedBox(height: 16),
                                                LocationSection(
                                                  selectedLocation:
                                                      state.location,
                                                  selectedAddress:
                                                      state.address,
                                                  onAddressChanged:
                                                      (String value) => context
                                                          .read<
                                                              AddRequestCubit>()
                                                          .addressChanged(
                                                              value),
                                                  onLocationChanged: (
                                                    LocationSudan value,
                                                  ) =>
                                                      context
                                                          .read<
                                                              AddRequestCubit>()
                                                          .locationChanged(
                                                              value),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Align(
                                    child: SizedBox(
                                      child: SalamtakButton(
                                        onTap: () {
                                          context
                                              .read<AddRequestCubit>()
                                              .addRequest();
                                        },
                                        text: context.l10n.add_request,
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
                    ),
                  );
                },
              ),
            ],
          )
        : const LoginToContinueWidget();
  }
}
