import 'package:flutter/material.dart';
import 'package:salamtak/core/enums/enums.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/add_request_body.dart';
import 'package:salamtak/features/medication_feature/presentation/add_request/widgets/medication_form_info.dart';

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
    return Card(
      color: Theme.of(context).colorScheme.tertiary,
      elevation: 6,
      child: Padding(
        padding:
            const EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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
          ),
        ),
      ),
    );
  }
}
