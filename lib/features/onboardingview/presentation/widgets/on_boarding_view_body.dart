import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 700,
      child: Stack(
        children: [
          Positioned(
            top: -30,
            left: -20,
            child: Image.asset(
              'assets/onBoardingImages/backgroundOnboarding.png',
              height: 480,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 160,
            left: -20,
            child: Image.asset('assets/onBoardingImages/firstOnboarding.png'),
            height: 350,
          ),
        ],
      ),
    );
  }
}
