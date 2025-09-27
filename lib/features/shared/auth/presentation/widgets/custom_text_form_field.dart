import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.name,
    required this.hintText,

    this.iconPath,
    this.validator,
    required this.controller,
    this.nameTextStyle,
    this.suffixIcon,
  });
  final String name;
  final TextStyle? nameTextStyle;
  final Widget? suffixIcon;
  final String hintText;
  final String? iconPath;
  final String? Function(String?)? validator;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: nameTextStyle == null ? Styles.textStyle14 : nameTextStyle!,
          ),
          SizedBox(height: 8.h),
          Container(
            width: 335.w,

            child: TextFormField(
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: iconPath != null
                    ? Padding(
                        padding: EdgeInsets.all(8.sp),
                        child: SvgPicture.asset(
                          iconPath!,
                          width: 16.w,
                          height: 16.h,
                        ),
                      )
                    : null,
                suffixIcon: suffixIcon != null
                    ? Padding(padding: EdgeInsets.all(8.sp), child: suffixIcon)
                    : null,
                filled: true,
                fillColor: Colors.white,
                hintText: hintText,
                hintStyle: Styles.textStyle14,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: kPrimaryColor, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
