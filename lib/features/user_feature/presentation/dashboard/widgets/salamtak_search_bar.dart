import 'package:flutter/material.dart';
import 'package:salamtak/l10n/l10n.dart';
import 'package:salamtak/util/constants.dart';

class SalamtakSearchBar extends StatelessWidget {
  const SalamtakSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: lightGreen,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 22,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: context.l10n.type_medication_name,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: lightGreen.withOpacity(0.5),
          ),
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
    );
  }
}
