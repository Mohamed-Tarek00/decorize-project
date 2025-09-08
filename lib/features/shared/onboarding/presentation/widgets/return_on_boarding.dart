import 'package:decorize_project/core/utils/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ReturnOnBoarding extends StatelessWidget {
  const ReturnOnBoarding({
    super.key,
    required this.currentPageIndex,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentPageIndex;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        currentPageIndex > 0
            ? _pageController.previousPage(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              )
            : null;
      },
      style: TextButton.styleFrom(foregroundColor: Colors.grey),

      child: Row(
        children: [
          SvgPicture.asset(
            'assets/icons/arrow-right.svg',
            height: 20.h,
            width: 20.w,
          ),
          Text('back'.tr(), style: Styles.textStyle14),
        ],
      ),
    );
  }
}
