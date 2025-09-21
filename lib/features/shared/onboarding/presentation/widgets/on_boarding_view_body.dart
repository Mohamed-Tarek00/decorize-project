import 'package:decorize_project/features/shared/onboarding/presentation/widgets/AnimatedContainers.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/widgets/next_on_boarding.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/widgets/on_boarding_item.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/widgets/return_on_boarding.dart';
import 'package:decorize_project/features/shared/onboarding/presentation/widgets/show_modal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key, required this.position});
  final Position? position;

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  List<Widget> onBoardingItems = [
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/firstOnboarding.png',
      title: 'onBoarding.step1.title'.tr(),
      description: 'onBoarding.step1.description'.tr(),
    ),
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/secondOnboarding.png',
      title: 'onBoarding.step2.title'.tr(),
      description: 'onBoarding.step2.description'.tr(),
    ),
    OnBoardingItem(
      imagePath: 'assets/onBoardingImages/thirdOnboarding.png',
      title: 'onBoarding.step3.title'.tr(),
      description: 'onBoarding.step3.description'.tr(),
    ),
  ];
  int currentPageIndex = 0;
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) {
              setState(() {
                currentPageIndex = value;
              });
            },
            children: onBoardingItems,
          ),
          Positioned(
            top: screenHeight * .01,
            left: 0,
            right: 0,
            child: Row(
              children: [
                currentPageIndex == 0
                    ? SizedBox.shrink()
                    : ReturnOnBoarding(
                        currentPageIndex: currentPageIndex,
                        pageController: _pageController,
                      ),
                Spacer(),

                NextOnBoarding(
                  onPressedLastPage: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.r),
                        ),
                      ),
                      context: context,
                      builder: (context) =>
                          ShowModal(position: widget.position),
                    );
                  },
                  currentPageIndex: currentPageIndex,
                  onBoardingItems: onBoardingItems,
                  pageController: _pageController,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: screenHeight * .17,
            left: 0,
            right: 0,
            child: AnimatedContainers(
              onBoardingItems: onBoardingItems,
              currentPageIndex: currentPageIndex,
            ),
          ),
          Positioned(
            bottom: screenHeight * .05,
            left: 0,
            right: 0,
            child: CustomButton(
              onPressed: () {
                if (currentPageIndex < onBoardingItems.length - 1) {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20.r),
                      ),
                    ),
                    context: context,
                    builder: (context) => ShowModal(position: widget.position),
                  );
                }
              },
              text: currentPageIndex == 0 ? 'start'.tr() : 'next'.tr(),
            ),
          ),
        ],
      ),
    );
  }
}
