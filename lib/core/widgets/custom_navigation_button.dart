import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavigationButton extends StatelessWidget {
  const CustomNavigationButton({
    super.key,
    required this.solidText,
    required this.navigationText,
    required this.onPressed,
  });
  final String solidText;
  final String navigationText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          solidText,
          style: Styles.textStyle14.copyWith(
            color: Color(0xFF8B8B8B),
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: onPressed,
          child: Column(
            children: [
              Text(
                navigationText,
                style: Styles.textStyle14.copyWith(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2.h),
              Container(height: 2.h, width: 85.w, color: kPrimaryColor),
            ],
          ),
        ),
      ],
    );
  }
}
