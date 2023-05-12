import 'package:flutter/material.dart';
import 'package:salamtak/core/widgets/salamtak_button.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: context.l10n.type_medication_name,
            prefixIcon: Icon(
              Icons.search,
              color: lightGreen,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.zero,
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          width: double.infinity,
          child: SalamtakButton(),
        ),
      ],
    );
  }
}
