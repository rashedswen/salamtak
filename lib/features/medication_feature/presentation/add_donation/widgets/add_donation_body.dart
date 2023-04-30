import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';

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
                        text: 'Medication Name',
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
                              text: 'Medication Quantity',
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
                              text: 'Medication Expiry Date',
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
                        text: 'Medication Description',
                        maxLines: 6,
                        onChanged: (String value) => context
                            .read<AddDonationCubit>()
                            .descriptionChanged(value),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Image (Optional)',
                        style: TextStyle(
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
                            child: const Text('Upload Image'),
                          ),
                          const SizedBox(width: 16),
                          if (state.imageUrl != null)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                File(state.imageUrl!.path!),
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AddDonationCubit>().addDonation();
                          },
                          child: const Text('Add Donation'),
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
