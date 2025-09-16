import 'package:decorize_project/core/utils/screen_size.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final void Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
 

    return TextButton(
      onPressed: onPressed,
      child: Container(
        height: ScreenSize.getWidgethighet(percantage: 07, context: context) ,
        width: ScreenSize.getWidgethighet(percantage: .9 ,context: context),
        decoration: BoxDecoration(
          color: Color(0xff0C5137),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: Styles.textStyle14.copyWith(color: Colors.white)),
            SvgPicture.asset(
              'assets/icons/next-arrow.svg',
              height: 16.h,
              width: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
