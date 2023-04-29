part of 'add_request_body.dart';

class MedicationFormCard extends StatelessWidget {
  const MedicationFormCard({
    super.key,
    required this.onSelect,
    required this.icon,
    required this.color,
    required this.form,
    required this.isSelected,
  });

  final VoidCallback onSelect;
  final IconData icon;
  final Color color;
  final MedicineForm form;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: SizedBox(
        height: 100,
        width: 90,
        child: Card(
          color: isSelected ? Colors.blue.shade50 : Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FaIcon(
                  icon,
                  size: 36,
                  color: color,
                ),
                FittedBox(
                  child: Text(
                    context.l10n.localeName == 'en'
                        ? form.arabicName
                        : form.englishName,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
