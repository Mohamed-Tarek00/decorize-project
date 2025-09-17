import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, this.onTap, required this.headingText});
  final void Function()? onTap;
  final String headingText;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          SizedBox(height: 40.h),
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(
              'assets/icons/arrow-right.svg',
              height: 20.h,
              width: 30.w,
            ),
          ),
          Spacer(),
          Text(headingText, style: Styles.textStyle18),
          Spacer(),
          SizedBox(width: 30.w, height: 20.h),
        ],
      ),
    );
  }
}
