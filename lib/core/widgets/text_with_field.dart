import 'package:flutter/material.dart';
import 'package:salamtak/util/constants.dart';

class TextWithField extends StatelessWidget {
  const TextWithField({
    super.key,
    required this.text,
    required this.onChanged,
    this.obscureText = false,
    this.maxLines = 1,
    this.onTap,
    this.value,
    this.keyboardType,
    this.errorText,
    this.hintText,
  });

  final String text;
  final void Function(String) onChanged;
  final int maxLines;
  final void Function()? onTap;
  final String? value;
  final TextInputType? keyboardType;
  final String? errorText;
  final bool obscureText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    const borderRedius = 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: lightGreen,
          ),
        ),
        const SizedBox(height: 8),
        PhysicalModel(
          color: Colors.transparent,
          elevation: 3,
          borderRadius: BorderRadius.circular(borderRedius),
          child: TextFormField(
            onTap: onTap,
            obscureText: obscureText,
            controller:
                value == null ? null : TextEditingController(text: value),
            maxLines: maxLines,
            readOnly: onTap != null,
            showCursor: onTap == null,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: keyboardType,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              errorText: errorText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(borderRedius),
              ),
              contentPadding: const EdgeInsets.all(8),
            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}
