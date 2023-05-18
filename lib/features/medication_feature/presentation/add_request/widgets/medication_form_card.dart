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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onSelect,
        child: SizedBox(
          height: 100,
          width: 90,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  lightGreen,
                  darkGreen,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: darkGreen.withOpacity(0.5),
                        blurRadius: 4,
                        offset: const Offset(0, 5),
                      ),
                    ]
                  : null,
            ),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FaIcon(
                  icon,
                  size: 36,
                  color: Colors.white,
                ),
                FittedBox(
                  child: Text(
                    context.l10n.localeName == 'ar'
                        ? form.arabicName
                        : form.englishName,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
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
