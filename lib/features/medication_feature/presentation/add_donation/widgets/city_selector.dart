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
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: LocationSudan.getSudanCities().length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              onTap(LocationSudan.getSudanCities()[index]);
            },
            child: Column(
              children: [
                Container(
                  color:
                      selectedLocation == LocationSudan.getSudanCities()[index]
                          ? Colors.blue.shade50
                          : null,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    LocationSudan.getSudanCities()[index].cityArabic,
                  ),
                ),
                if (LocationSudan.getSudanCities().last !=
                    LocationSudan.getSudanCities()[index])
                  const Divider()
              ],
            ),
          );
        },
      ),
    );
  }
}
