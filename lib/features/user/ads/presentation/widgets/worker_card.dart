import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WorkerCard extends StatelessWidget {
  const WorkerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundImage: AssetImage('assets/icons/workertestphoto.png'),
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'علي السعيد',
              style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SvgPicture.asset('assets/icons/star.svg'),
                SizedBox(width: 5.w),
                Text(
                  '4.9',
                  style: Styles.textStyle14.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'نجار',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w700,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              '200 ريال',
              style: Styles.textStyle14.copyWith(
                fontWeight: FontWeight.w700,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
