import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/city_selector.dart';
import 'package:salamtak/core/widgets/text_with_field.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/json/states_and_cities.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({
    super.key,
    required this.onLocationChanged,
    this.selectedLocation,
    required this.onAddressChanged,
    this.selectedAddress,
  });

  final void Function(LocationSudan) onLocationChanged;
  final LocationSudan? selectedLocation;
  final void Function(String) onAddressChanged;
  final String? selectedAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.city,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        CitySelector(
          onTap: onLocationChanged,
          selectedLocation: selectedLocation,
        ),
        const SizedBox(
          height: 16,
        ),
        TextWithField(
          text: context.l10n.address,
          onChanged: onAddressChanged,
          value: selectedAddress,
        ),
      ],
    );
  }
}
