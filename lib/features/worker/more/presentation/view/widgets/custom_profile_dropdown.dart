import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomProfileDropdown extends StatelessWidget {
  final String label;
  final String hint;
  final List<String> items;
  final String iconPath;

  const CustomProfileDropdown({
    super.key,
    required this.label,
    required this.hint,
    required this.items,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 6),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            prefixIcon: SizedBox(
              width: 20,
              height: 20,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgPicture.asset(
                  iconPath,
                  color: Colors.black,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEEEEEE)),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEEEEEE)),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 8,
            ),
          ),
          hint: Text(hint),
          items: items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
          onChanged: (value) {},
        ),
      ],
    );
  }
}
