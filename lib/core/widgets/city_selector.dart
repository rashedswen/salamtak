import 'package:flutter/material.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class CitySelector extends StatelessWidget {
  const CitySelector({
    super.key,
    required this.onTap,
    this.selectedLocation,
  });

  final void Function(LocationSudan location) onTap;
  final LocationSudan? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<LocationSudan>(
        value: selectedLocation,
        hint: const Text('اختر المدينة'),
        isExpanded: true,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
        dropdownColor: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        underline: const SizedBox(),
        menuMaxHeight: 200,
        onChanged: (value) {
          onTap(value!);
        },
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        items: LocationSudan.getSudanCities().map((e) {
          return DropdownMenuItem<LocationSudan>(
            value: e,
            child: Text(e.cityArabic),
          );
        }).toList(),
      ),
    );
  }
}
