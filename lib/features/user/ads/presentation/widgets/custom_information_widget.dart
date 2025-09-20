import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomInformationWidget extends StatelessWidget {
  const CustomInformationWidget({
    super.key,
    required this.content,
    required this.iconPath,
    required this.title,
  });
  final List<Widget> content;
  final String iconPath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.sp),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/information.svg',
                  width: 20.w,
                  height: 20.h,
                ),
                SizedBox(width: 5.w),
                Text(
                  'بيانات الطلب',
                  style: Styles.textStyle14.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(color: Colors.grey.shade300, thickness: 1.25.h),
            Column(children: content),
          ],
        ),
      ),
    );
  }
}
