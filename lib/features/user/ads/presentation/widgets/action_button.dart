import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isFilled;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isFilled = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: isFilled ? kPrimaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: isFilled
              ? null
              : Border.all(width: 1.w, color: kPrimaryColor),
        ),
        child: Center(
          child: Text(
            text,
            style: Styles.textStyle16.copyWith(
              color: isFilled ? Colors.white : kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
