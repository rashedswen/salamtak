import 'package:flutter/material.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_info.dart';
import 'package:salamtak/features/medication_feature/util/enums/enums.dart';

class MedicationFormSection extends StatelessWidget {
  const MedicationFormSection({
    super.key,
    required this.selectedForm,
    required this.onSelect,
  });

  final MedicineForm selectedForm;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: medicineFormList
          .map(
            (item) => MedicationFormCard(
              form: item.form,
              onSelect: () => onSelect(item.form),
              icon: item.icon,
              color: item.color,
              isSelected: selectedForm == item.form,
            ),
          )
          .toList(),
    );
  }
}
