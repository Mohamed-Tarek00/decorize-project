import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  final String imagePath;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 375.w,
          child: Stack(
            children: [
              Positioned(
                top: -20.h,
                child: Image.asset(
                  'assets/onBoardingImages/backgroundOnboarding.png',
                  width: 375.w,
                ),
              ),
              Positioned(
                top: 70.h,
                left: 5.w,
                child: Image.asset(imagePath),
                height: 310.h,
                width: 350.w,
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(height: 450.h),
              Text(
                title,
                style: Styles.textStyle28.copyWith(color: Color(0xff0C5137)),
              ),
              SizedBox(
                width: 350.w,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Styles.textStyle20.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
