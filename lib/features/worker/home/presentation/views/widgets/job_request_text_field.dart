import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class JobRequestTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final int maxLines;
  final TextEditingController? controller;
  final Widget? customLabel;

  const JobRequestTextField({
    super.key,
    required this.label,
    this.hint,
    this.maxLines = 1,
    this.controller,
    this.customLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: customLabel ?? Text(label, style: Styles.textStyle14),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
          ),
        ),
      ],
    );
  }
}
