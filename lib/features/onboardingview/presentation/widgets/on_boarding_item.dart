import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                top: -screenHeight * 0.125,
                child: Image.asset(
                  'assets/onBoardingImages/backgroundOnboarding.png',
                  width: screenWidth,
                ),
              ),
              Positioned(
                top: screenHeight * 0.08,
                left: screenWidth * .09,
                child: Image.asset(imagePath),
                height: screenHeight * 0.47,
              ),
            ],
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.6),
              Text(
                title,
                style: Styles.textStyle28.copyWith(color: Color(0xff0C5137)),
              ),
              SizedBox(
                width: screenWidth * 0.9,
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
