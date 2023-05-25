import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/location_section.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_exchange/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/emergency_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/select_image.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

/// {@template add_exchange_body}
/// Body of the AddExchangePage.
///
/// Add what it does
/// {@endtemplate}
class AddExchangeBody extends StatelessWidget {
  /// {@macro add_exchange_body}
  const AddExchangeBody({super.key});

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
                      child: BlocBuilder<AddExchangeCubit, AddExchangeState>(
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
                                    text: context
                                        .l10n.medication_offered_in_exchange,
                                    onChanged: (String value) => context
                                        .read<AddExchangeCubit>()
                                        .nameChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  TextWithField(
                                    text: context
                                        .l10n.medication_wanted_in_exchange,
                                    onChanged: (String value) => context
                                        .read<AddExchangeCubit>()
                                        .exchangeMedicineNameChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    context
                                        .l10n.wanted_exchange_medication_type,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: lightGreen,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  MedicationFormSection(
                                    selectedForm: state.form,
                                    onSelect: (MedicineForm value) => context
                                        .read<AddExchangeCubit>()
                                        .formChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    context
                                        .l10n.offered_exchange_medication_type,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: lightGreen,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  MedicationFormSection(
                                    selectedForm: state.exchangeMedicineForm,
                                    onSelect: (MedicineForm value) => context
                                        .read<AddExchangeCubit>()
                                        .exchangeMedicineFormChanged(value),
                                  ),
                                  const SizedBox(height: 16),
                                  TextWithField(
                                    text: context.l10n.extra_description,
                                    maxLines: 6,
                                    onChanged: (String value) => context
                                        .read<AddExchangeCubit>()
                                        .descriptionChanged(value),
                                    value: state.description,
                                  ),
                                  const SizedBox(height: 16),
                                  BlocBuilder<AddExchangeCubit,
                                      AddExchangeState>(
                                    buildWhen: (previous, current) =>
                                        previous.emergencyLevel !=
                                        current.emergencyLevel,
                                    builder: (context, state) {
                                      print(state.emergencyLevel);
                                      return EmergencySection(
                                        selectedLevel: state.emergencyLevel,
                                        onTap: (EmergencyLevel value) => context
                                            .read<AddExchangeCubit>()
                                            .emergencyLevelChanged(value),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SelectImage(
                                          title: context.l10n
                                              .exhange_offered_medication_image,
                                          image: state.medicineImage,
                                          onImageChanged:
                                              (PlatformFile value) => context
                                                  .read<AddExchangeCubit>()
                                                  .medicineImageChanged(value),
                                        ),
                                      ),
                                      const SizedBox(height: 16),
                                      Expanded(
                                        child: SelectImage(
                                          title: context.l10n
                                              .exhange_wanted_medication_image,
                                          image: state.exchangeMedicineImage,
                                          onImageChanged: (PlatformFile value) {
                                            context
                                                .read<AddExchangeCubit>()
                                                .exchangeMedicineImageChanged(
                                                  value,
                                                );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  LocationSection(
                                    selectedLocation: state.location,
                                    selectedAddress: state.address,
                                    onAddressChanged: (String value) => context
                                        .read<AddExchangeCubit>()
                                        .addressChanged(value),
                                    onLocationChanged: (LocationSudan value) =>
                                        context
                                            .read<AddExchangeCubit>()
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
                                            .read<AddExchangeCubit>()
                                            .addExchange();
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
