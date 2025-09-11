import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class JobRequestCard extends StatelessWidget {
  const JobRequestCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsetsDirectional.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(12),
            child: Image.asset(
              'assets/home_images/image 16.png',
              width: 311.w,
              height: 163.h,
            ),
          ),
          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'مطلوب نجار',
                style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w500),
              ),
              Text(
                '500 ريال',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'نبحث عن نجار محترف ومبدع لتصميم غرفة مكتب أنيقة وعملية، حيث نرغب في أن تكون المساحة مريحة وعملية في نفس الوقت. قراءة المزيد',
            style: Styles.textStyle12.copyWith(fontWeight: FontWeight.w400),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 16.h),
          Container(
            width: 153.w,
            height: 40.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: kPrimaryColor,
            ),
            child: Center(
              child: Text(
                'التقديم للطلب',
                style: Styles.textStyle14.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
