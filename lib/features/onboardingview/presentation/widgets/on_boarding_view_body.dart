import 'package:decorize_project/features/onboardingview/presentation/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Expanded(
          // هنا خليه ياخد كل المساحة المتاحة
          child: PageView(children: onBoardingItems),
        ),
      ],
    );
  }
}
