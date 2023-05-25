import 'package:flutter/material.dart';
import 'package:salamtak/core/enums/emergency_level.dart';
import 'package:salamtak/l10n/l10n.dart';

class EmergencySection extends StatelessWidget {
  const EmergencySection({
    super.key,
    required this.selectedLevel,
    required this.onTap,
  });

  final EmergencyLevel selectedLevel;
  final void Function(EmergencyLevel) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
        color: Theme.of(context).colorScheme.surface,
      ),
      width: double.infinity,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: EmergencyLevel.values
                .map(
                  (emergencyLevel) => SizedBox(
                    height: 70,
                    width: 70,
                    child: InkWell(
                      onTap: () => onTap(emergencyLevel),
                      child: Card(
                        color: emergencyLevel.color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            color: selectedLevel == emergencyLevel
                                ? Colors.white
                                : Colors.transparent,
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Center(
                            child: FittedBox(
                              child: Text(
                                context.l10n.localeName == 'ar'
                                    ? emergencyLevel.arabicName
                                    : emergencyLevel.englishName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
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
        ),
      ),
    );
  }
}
