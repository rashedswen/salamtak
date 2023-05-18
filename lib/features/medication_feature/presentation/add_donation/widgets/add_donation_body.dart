import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salamtak/app/bloc/app_bloc.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/login_to_continue_widget.dart';
import 'package:salamtak/core/widgets/salamtak_app_bar.dart';
import 'package:salamtak/core/widgets/salamtak_background.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/city_selector.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/select_image.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

/// {@template add_donation_body}
/// Body of the AddDonationPage.
///
/// Add what it does
/// {@endtemplate}
class AddDonationBody extends StatelessWidget {
  /// {@macro add_donation_body}
  const AddDonationBody({super.key});

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
                      padding: const EdgeInsets.all(16),
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
                                  const SizedBox(height: 16),
                                  TextWithField(
                                    text: context.l10n.medication_name,
                                    onChanged: (String value) => context
                                        .read<AddDonationCubit>()
                                        .nameChanged(value),
                                  ),
                                  const SizedBox(height: 32),
                                  MedicationFormSection(
                                    selectedForm: state.form,
                                    onSelect: (MedicineForm value) => context
                                        .read<AddDonationCubit>()
                                        .formChanged(value),
                                  ),
                                  const SizedBox(height: 32),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextWithField(
                                          text:
                                              context.l10n.medication_quantity,
                                          keyboardType: TextInputType.number,
                                          onChanged: (String value) => context
                                              .read<AddDonationCubit>()
                                              .quantityChanged(value),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: BlocBuilder<AddDonationCubit,
                                            AddDonationState>(
                                          // buildWhen: (previous, current) =>
                                          //     previous.expiredAt !=
                                          //     current.expiredAt,
                                          builder: (context, state) {
                                            return TextWithField(
                                              value: state.expiredAt == null
                                                  ? ''
                                                  : DateFormat('y/M/d')
                                                      .format(state.expiredAt!),
                                              text: context
                                                  .l10n.medication_expiry_date,
                                              onTap: () async {
                                                final date =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime.now(),
                                                  lastDate: DateTime.now().add(
                                                    const Duration(days: 365),
                                                  ),
                                                );

                                                await context
                                                    .read<AddDonationCubit>()
                                                    .expiredAtChanged(date!);
                                              },
                                              onChanged: (String value) =>
                                                  context
                                                      .read<AddDonationCubit>()
                                                      .expiredAtChanged(
                                                        DateTime(
                                                          int.parse(value),
                                                        ),
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 32),
                                  TextWithField(
                                    text: context.l10n.extra_description,
                                    maxLines: 6,
                                    onChanged: (String value) => context
                                        .read<AddDonationCubit>()
                                        .descriptionChanged(value),
                                  ),
                                  const SizedBox(height: 32),
                                  SelectImage(
                                    title: context.l10n.medication_image,
                                    image: state.imageUrl,
                                    onImageChanged: (PlatformFile value) =>
                                        context
                                            .read<AddDonationCubit>()
                                            .imageChanged(value),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  // location dropdown
                                  LocationSection(
                                    selectedLocation: state.location,
                                    selectedAddress: state.address,
                                    onAddressChanged: (String value) => context
                                        .read<AddDonationCubit>()
                                        .addressChanged(value),
                                    onLocationChanged: (LocationSudan value) =>
                                        context
                                            .read<AddDonationCubit>()
                                            .locationChanged(value),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  const Spacer(),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        context
                                            .read<AddDonationCubit>()
                                            .addDonation();
                                      },
                                      child: Text(context.l10n.donation),
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

class LocationSection extends StatelessWidget {
  const LocationSection({
    super.key,
    required this.onLocationChanged,
    this.selectedLocation,
    required this.onAddressChanged,
    this.selectedAddress,
  });

  final void Function(LocationSudan) onLocationChanged;
  final LocationSudan? selectedLocation;
  final void Function(String) onAddressChanged;
  final String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.city,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: lightGreen,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CitySelector(
          onTap: onLocationChanged,
          selectedLocation: selectedLocation,
        ),
        const SizedBox(
          height: 16,
        ),
        TextWithField(
          text: context.l10n.address,
          onChanged: onAddressChanged,
          value: selectedAddress,
        ),
      ],
    );
  }
}
