import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/city_selector.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/l10n/l10n.dart';

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
    return LayoutBuilder(
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWithField(
                        text: context.l10n.medication_name,
                        onChanged: (String value) =>
                            context.read<AddDonationCubit>().nameChanged(value),
                      ),
                      const SizedBox(height: 32),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: MedicationFormSection(
                          selectedForm: state.form,
                          onSelect: (MedicineForm value) => context
                              .read<AddDonationCubit>()
                              .formChanged(value),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: TextWithField(
                              text: context.l10n.medication_quantity,
                              keyboardType: TextInputType.number,
                              onChanged: (String value) => context
                                  .read<AddDonationCubit>()
                                  .quantityChanged(value),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextWithField(
                              value: state.expiredAt == null
                                  ? ''
                                  : DateFormat('y/M/d')
                                      .format(state.expiredAt!),
                              text: context.l10n.medication_expiry_date,
                              onTap: () {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now().add(
                                    const Duration(days: 365),
                                  ),
                                ).then(
                                  (value) => context
                                      .read<AddDonationCubit>()
                                      .expiredAtChanged(value!),
                                );
                              },
                              onChanged: (String value) => context
                                  .read<AddDonationCubit>()
                                  .expiredAtChanged(DateTime(int.parse(value))),
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
                      Text(
                        context.l10n.medication_image,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              final path = await selectImage();
                              print(path);
                              if (path != null) {
                                await context
                                    .read<AddDonationCubit>()
                                    .imageChanged(path);
                              }
                            },
                            child: Text(context.l10n.upload_image),
                          ),
                          const SizedBox(width: 16),
                          if (state.imageUrl != null)
                            if (!kIsWeb)
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.file(
                                  File(state.imageUrl!.path!),
                                  fit: BoxFit.contain,
                                ),
                              ),
                          if (state.imageUrl != null)
                            if (kIsWeb)
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.memory(
                                  state.imageUrl!.bytes!,
                                  fit: BoxFit.contain,
                                ),
                              ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      // location dropdown
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.city,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: CitySelector(
                              onTap: (location) {
                                context
                                    .read<AddDonationCubit>()
                                    .locationChanged(
                                      location,
                                    );
                              },
                              selectedLocation: state.location,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextWithField(
                        text: context.l10n.address,
                        onChanged: (value) {
                          context
                              .read<AddDonationCubit>()
                              .addressChanged(value);
                        },
                      ),
                      const Spacer(),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AddDonationCubit>().addDonation();
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
    );
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
