import 'package:flutter/material.dart';
import 'package:salamtak/util/constants.dart';

class TextWithField extends StatefulWidget {
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
  State<TextWithField> createState() => _TextWithFieldState();
}

class _TextWithFieldState extends State<TextWithField> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    textController.text = widget.value ?? '';
  }

  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    const borderRedius = 10.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
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
            onTap: widget.onTap,
            obscureText: widget.obscureText,
            controller: textController,
            maxLines: widget.maxLines,
            readOnly: widget.onTap != null,
            showCursor: widget.onTap == null,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            keyboardType: widget.keyboardType,
            decoration: InputDecoration(
              hintText: widget.hintText,
              filled: true,
              errorText: widget.errorText,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(borderRedius),
              ),
              contentPadding: const EdgeInsets.all(8),
            ),
            onChanged: (value) {
              textController.selection =
                  TextSelection.collapsed(offset: textController.text.length);
              widget.onChanged(value);
            },
          ),
        ),
      ],
    );
  }
}
