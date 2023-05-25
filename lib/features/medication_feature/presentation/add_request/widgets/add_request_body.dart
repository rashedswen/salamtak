import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/location_section.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/widgets.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/emergency_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/select_image.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

part 'medication_form_card.dart';

/// {@template add_request_body}
/// Body of the AddRequestPage.
///
/// Add what it does
/// {@endtemplate}
class AddRequestBody extends StatelessWidget {
  /// {@macro add_request_body}
  const AddRequestBody({super.key});

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
                      padding: const EdgeInsets.all(16),
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
                                  TextWithField(
                                    text: context.l10n.medication_name,
                                    onChanged: (String value) => context
                                        .read<AddRequestCubit>()
                                        .nameChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  MedicationFormSection(
                                    selectedForm: state.form,
                                    onSelect: (MedicineForm value) => context
                                        .read<AddRequestCubit>()
                                        .formChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  TextWithField(
                                    text: context.l10n.extra_description,
                                    maxLines: 6,
                                    onChanged: (String value) => context
                                        .read<AddRequestCubit>()
                                        .descriptionChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  EmergencySection(
                                    selectedLevel: state.emergencyLevel,
                                    onTap: (EmergencyLevel value) => context
                                        .read<AddRequestCubit>()
                                        .emergencyLevelChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SelectImage(
                                          title: context.l10n.medication_image,
                                          image: state.image,
                                          onImageChanged:
                                              (PlatformFile value) => context
                                                  .read<AddRequestCubit>()
                                                  .imageChanged(value),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Expanded(
                                        child: SelectImage(
                                          title:
                                              context.l10n.prescription_image,
                                          image: state.prescription,
                                          onImageChanged: (PlatformFile value) {
                                            context
                                                .read<AddRequestCubit>()
                                                .prescriptionChanged(value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  LocationSection(
                                    selectedLocation: state.location,
                                    selectedAddress: state.address,
                                    onAddressChanged: (String value) => context
                                        .read<AddRequestCubit>()
                                        .addressChanged(value),
                                    onLocationChanged: (LocationSudan value) =>
                                        context
                                            .read<AddRequestCubit>()
                                            .locationChanged(value),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<AddRequestCubit>()
                                            .addRequest();
                                      },
                                      child: Text(context.l10n.request),
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
