import 'package:decorize_project/features/onboardingview/presentation/widgets/on_boarding_item.dart';
import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [OnBoardingItem()]);
  }
}
