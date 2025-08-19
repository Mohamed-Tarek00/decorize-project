import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/onBoardingImages/firstOnboarding.svg'),
        Positioned(
          top: -70,
          child: SvgPicture.asset(
            'assets/onBoardingImages/backgroundOnboarding.svg',
            height: 500,
          ),
        ),
      ],
    );
  }
}
