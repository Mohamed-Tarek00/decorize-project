import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WorkerProfileHeader extends StatelessWidget {
  const WorkerProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentGeometry.bottomLeft,
          children: [
            CircleAvatar(
              radius: 50,
              child: Image.asset('assets/design/worker_profile.png'),
            ),
            Container(
              padding: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Color(0xff9D5C0D).withOpacity(.31)),
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                'assets/icons/edit.svg',
                color: Color(0xff9D5C0D),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          'أحمد محمد',
          style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'نجار',
              style: Styles.textStyle14.copyWith(color: Color(0xff67675C)),
            ),
            SizedBox(width: 8.w),
            Text(
              '|',
              style: Styles.textStyle14.copyWith(color: Color(0xff67675C)),
            ),
            SizedBox(width: 8.w),

            Icon(Icons.star, color: Color(0xffFFD012)),
            SizedBox(width: 4.w),

            Text(
              '4,9',
              style: Styles.textStyle14.copyWith(color: Color(0xff67675C)),
            ),
          ],
        ),
      ],
    );
  }
}
