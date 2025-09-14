import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/user/home/presentation/views/widgets/custom_add_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButtomNavBar extends StatelessWidget {
  const CustomButtomNavBar({
    super.key,
    required this.onTap,
    required this.currentIndex,
  });

  final void Function(int) onTap;
  final int currentIndex;
  Widget buildNavItem({
    required String iconPath,
    required int index,
    required String text,
  }) {
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24.h,
            width: 24.w,
            color: currentIndex == index ? kPrimaryColor : Colors.grey,
          ),
          Text(
            text,
            style: Styles.textStyle14.copyWith(
              color: currentIndex == index ? kPrimaryColor : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 55.h,
          color: Colors.white,

          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [
              buildNavItem(
                iconPath: 'assets/icons/home.svg',
                text: 'الرئيسية',
                index: 0,
              ),
              buildNavItem(
                iconPath: 'assets/icons/orders.svg',
                text: 'طلباتي',
                index: 1,
              ),
              SizedBox(width: 80.w),
              buildNavItem(
                iconPath: 'assets/icons/workers.svg',
                text: 'العمال',
                index: 2,
              ),
              buildNavItem(
                iconPath: 'assets/icons/more.svg',
                text: 'المزيد',
                index: 3,
              ),
            ],
          ),
        ),
        Positioned(
          top: -25,
          left: MediaQuery.of(context).size.width / 2 - 40.w,
          child: CustomAddButton(),
        ),
      ],
    );
  }
}
