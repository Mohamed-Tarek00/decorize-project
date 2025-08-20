import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/onboardingview/presentation/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  List<Widget> onBoardingItems = [
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/firstOnboarding.png',
      title: 'اكتشف مساحتك الجديدة',
      description: 'صمم، تخيل، وحقق أحلامك في تصميم منزلك أو مكتبك بكل سهولة',
    ),
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/secondOnboarding.png',
      title: 'اكتشف مساحتك الجديدة',
      description: 'صمم، تخيل، وحقق أحلامك في تصميم منزلك أو مكتبك بكل سهولة',
    ),
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/thirdOnboarding.png',
      title: 'اكتشف مساحتك الجديدة',
      description: 'صمم، تخيل، وحقق أحلامك في تصميم منزلك أو مكتبك بكل سهولة',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Stack(
        children: [
          PageView(children: onBoardingItems),
          Positioned(
            top: .03 * screenHeight,
            left: 0,
            right: 0,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.grey),

                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        height: 20.h,
                        width: 20.w,
                      ),
                      Text('رجوع', style: Styles.textStyle14),
                    ],
                  ),
                ),
                Spacer(),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(foregroundColor: Colors.black),
                  child: Text(
                    'تخطي',

                    style: Styles.textStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
