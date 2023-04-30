part of 'add_request_body.dart';

class TextWithField extends StatelessWidget {
  const TextWithField({
    super.key,
    required this.text,
    required this.onChanged,
    this.maxLines = 1,
    this.onTap,
    this.value,
    this.keyboardType,
  });

  final String text;
  final void Function(String) onChanged;
  final int maxLines;
  final void Function()? onTap;
  final String? value;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 16),
        TextField(
          onTap: onTap,
          controller: value == null ? null : TextEditingController(text: value),
          maxLines: maxLines,
          readOnly: onTap != null,
          showCursor: onTap == null,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            fillColor: Colors.blue.shade100,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(4),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
          onChanged: onChanged,
        ),
      ],
    );
  }
}
