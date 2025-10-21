import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBannerWidget extends StatelessWidget {
  const CustomBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        alignment: AlignmentGeometry.centerLeft,
        children: [
          Positioned(
            right: 12.w,
            child: SizedBox(
              width: 200.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'حقق طموحاتك، وابدأ رحلتك المهنية !',
                    style: Styles.textStyle12.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    maxLines: 3,
                    '"انضم إلى مجتمعنا اليوم، وتقدم لطلبات الخدمات المتنوعة. تواصل مباشرة مع العملاء وحقق النجاح الذي تستحقه!"',
                    style: Styles.textStyle10.copyWith(color: Colors.white),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    height: 24.h,
                    width: 62.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'ابدأ الان',
                        style: Styles.textStyle10.copyWith(
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Image.asset('assets/home_images/medium-shot-man-posing-studio 1.png'),
        ],
      ),
    );
  }
}
