import 'package:decorize_project/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NextOnBoarding extends StatelessWidget {
  const NextOnBoarding({
    super.key,
    required this.currentPageIndex,
    required this.onBoardingItems,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentPageIndex;
  final List<Widget> onBoardingItems;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        currentPageIndex < onBoardingItems.length - 1
            ? _pageController.nextPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              )
            : null;
      },
      style: TextButton.styleFrom(foregroundColor: Colors.black),
      child: Text(
        "skip".tr(),

        style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
