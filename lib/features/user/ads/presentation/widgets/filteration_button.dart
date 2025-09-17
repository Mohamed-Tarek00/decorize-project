import 'package:decorize_project/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FilterationButton extends StatelessWidget {
  const FilterationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          border: Border.all(width: 1, color: kPrimaryColor),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/filter.svg',
            height: 25.h,
            width: 25.w,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
