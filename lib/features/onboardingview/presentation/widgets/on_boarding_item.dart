import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: screenHeight * 0.65,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/onBoardingImages/backgroundOnboarding.png',
                  height: screenHeight * 0.55,
                ),
              ),
              Positioned(
                top: screenHeight * 0.13,
                left: screenWidth * .05,
                child: Image.asset(
                  'assets/onBoardingImages/firstOnboarding.png',
                ),
                height: screenHeight * 0.42,
              ),
            ],
          ),
        ),
        Text(
          'اكتشف مساحتك الجديدة',
          style: Styles.textStyle28.copyWith(color: Color(0xff0C5137)),
        ),
        SizedBox(
          width: screenWidth * 0.9,
          child: Text(
            'صمم، تخيل، وحقق أحلامك في تصميم منزلك أو مكتبك بكل سهولة',
            textAlign: TextAlign.center,
            style: Styles.textStyle20,
          ),
        ),
      ],
    );
  }
}
