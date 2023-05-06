import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/features/medication_feature/presentation/add_donation/widgets/city_selector.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/cubit/cubit.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_section.dart';
import 'package:salamtak/l10n/l10n.dart';

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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextWithField(
                        text: context.l10n.medication_name,
                        onChanged: (String value) =>
                            context.read<AddRequestCubit>().nameChanged(value),
                      ),
                      const SizedBox(height: 16),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: MedicationFormSection(
                          selectedForm: state.form,
                          onSelect: (MedicineForm value) => context
                              .read<AddRequestCubit>()
                              .formChanged(value),
                        ),
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
                      Row(
                        children: EmergencyLevel.values
                            .map(
                              (emergencyLevel) => Expanded(
                                child: SizedBox(
                                  height: 100,
                                  child: InkWell(
                                    onTap: () => context
                                        .read<AddRequestCubit>()
                                        .emergencyLevelChanged(emergencyLevel),
                                    child: Card(
                                      color:
                                          state.emergencyLevel == emergencyLevel
                                              ? Colors.blue.shade50
                                              : Colors.white,
                                      child: Center(
                                        child: FittedBox(
                                          child: Text(
                                            context.l10n.localeName == 'ar'
                                                ? emergencyLevel.arabicName
                                                : emergencyLevel.englishName,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  color: emergencyLevel.color,
                                                ),
                                            textAlign: TextAlign.center,
                                            softWrap: true,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 16),
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
                                    .read<AddRequestCubit>()
                                    .imageChanged(path);
                              }
                            },
                            child: Text(context.l10n.upload_image),
                          ),
                          const SizedBox(width: 16),
                          if (state.image != null)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                File(state.image!.path!),
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
                      Text(
                        context.l10n.prescription_image,
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
                              if (path != null) {
                                await context
                                    .read<AddRequestCubit>()
                                    .prescriptionChanged(path);
                              }
                            },
                            child: Text(context.l10n.upload_image),
                          ),
                          const SizedBox(width: 16),
                          if (state.prescription != null)
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                File(state.prescription!.path!),
                                fit: BoxFit.contain,
                              ),
                            ),
                        ],
                      ),
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
                                context.read<AddRequestCubit>().locationChanged(
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
                          context.read<AddRequestCubit>().addressChanged(value);
                        },
                      ),
                      const Spacer(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<AddRequestCubit>().addRequest();
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
