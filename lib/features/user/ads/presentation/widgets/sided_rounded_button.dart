import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidedRoundedButton extends StatelessWidget {
  const SidedRoundedButton({
    super.key,
    required this.isRight,
    required this.headingText,
    required this.onTap,
    required this.isSelected,
  });
  final void Function()? onTap;

  final bool isRight;
  final String headingText;
  final isSelected;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 160.w,
        clipBehavior: Clip.hardEdge,

        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(color: Colors.grey.shade300, width: 1.25),
            bottom: BorderSide(color: Colors.grey.shade300, width: 1.25),
            right: isRight
                ? BorderSide(color: Colors.grey.shade300, width: 1.25)
                : BorderSide.none,
            left: isRight
                ? BorderSide.none
                : BorderSide(color: Colors.grey.shade300, width: 1.25),
          ),
          borderRadius: isRight
              ? BorderRadius.only(
                  topRight: Radius.circular(12.r),
                  bottomRight: Radius.circular(12.r),
                )
              : BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  bottomLeft: Radius.circular(12.r),
                ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isSelected
                ? Container(height: 3.h, width: 160.w, color: kPrimaryColor)
                : SizedBox(height: 3.h),
            Expanded(
              child: Center(
                child: Text(
                  headingText,

                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                    color: isSelected ? kPrimaryColor : Colors.grey,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
