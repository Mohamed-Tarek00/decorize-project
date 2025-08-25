import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('الاسم', style: Styles.textStyle14),
          SizedBox(height: 10.h),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.all(6.h),
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 16.w,
                  height: 16.h,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              hintText: 'ادخل الاسم',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kPrimaryColor, width: 2),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
