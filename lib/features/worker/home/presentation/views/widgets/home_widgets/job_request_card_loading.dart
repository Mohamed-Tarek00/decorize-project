import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class JobRequestCardLoading extends StatelessWidget {
  const JobRequestCardLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsetsDirectional.only(top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة
            Container(
              width: 311.w,
              height: 140.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100.w,
                  height: 14.h,
                  color: Colors.grey.shade300,
                ),
                Container(
                  width: 60.w,
                  height: 14.h,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Container(
              width: double.infinity,
              height: 30.h,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 12.h),
            Container(
              width: 153.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
