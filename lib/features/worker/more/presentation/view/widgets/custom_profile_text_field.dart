import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomProfileTextField extends StatelessWidget {
  final String label;
  final String hint;
  final String iconPath;
  final bool obscureText;
  final bool showEditButton;
  final void Function()? onTap;

  const CustomProfileTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.iconPath,
    this.obscureText = false,
    this.showEditButton = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Styles.textStyle14),
        const SizedBox(height: 6),
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: showEditButton == false
                ? SizedBox.shrink()
                : GestureDetector(
                    onTap: onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "تعديل",
                          style: Styles.textStyle12.copyWith(
                            color: kPrimaryColor,
                          ),
                        ),
                        Container(
                          width: 30.w,
                          height: 1.h,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
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

            hintText: hint,
            hintStyle: Styles.textStyle14.copyWith(color: Color(0xff8B8B8B)),
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
        ),
      ],
    );
  }
}
