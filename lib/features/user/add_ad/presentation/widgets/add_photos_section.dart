import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AddPhotosSection extends StatelessWidget {
  const AddPhotosSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('التصنيف', style: Styles.textStyle18),
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.all(8.sp),

            width: 335.w,
            height: 100.h,
            decoration: BoxDecoration(
              border: Border.all(width: 1.5, color: Colors.grey.shade300),
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: SvgPicture.asset('assets/icons/add_photo.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
