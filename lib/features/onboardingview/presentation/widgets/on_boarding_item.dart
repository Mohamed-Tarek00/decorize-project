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
                top: screenHeight * 0.125,
                left: screenWidth * .07,
                child: Image.asset(imagePath),
                height: screenHeight * 0.38,
              ),
            ],
          ),
        ),
        Text(
          title,
          style: Styles.textStyle28.copyWith(color: Color(0xff0C5137)),
        ),
        SizedBox(
          width: screenWidth * 0.9,
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Styles.textStyle20,
          ),
        ),
      ],
    );
  }
}
