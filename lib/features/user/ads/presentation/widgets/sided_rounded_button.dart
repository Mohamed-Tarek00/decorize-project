import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidedRoundedButton extends StatelessWidget {
  const SidedRoundedButton({super.key, required this.isRight});

  final bool isRight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      width: 160.w,

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
      child: Center(
        child: Text(
          "تفاصيل الاعلان",
          style: Styles.textStyle12.copyWith(
            fontWeight: FontWeight.w300,
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
