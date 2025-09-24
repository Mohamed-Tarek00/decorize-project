import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAddButton extends StatelessWidget {
  const CustomAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(AppRouterNames.addAdView);
      },
      child: Container(
        width: 80.w,
        height: 80.h,
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: Center(
          child: Container(
            width: 65.w,
            height: 65.h,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              shape: BoxShape.circle,
              border: Border.all(color: Color(0xffF2F2F2), width: 4.w),
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/add.svg',
                height: 24.h,
                width: 24.w,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
