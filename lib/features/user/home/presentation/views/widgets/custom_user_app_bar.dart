import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomUserAppBar extends StatelessWidget {
  const CustomUserAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 42.0.h,
          left: 8.h,
          right: 8.h,
          bottom: 24.h,
        ),

        child: Row(
          children: [
            Image.asset(
              'assets/icons/usertestphoto.png',
              height: 50.h,
              width: 50.w,
            ),
            SizedBox(width: 10.h),
            Column(
              children: [
                Text('مرحبا بك !', style: Styles.textStyle16),
                Text('يوسف السيد', style: Styles.textStyle16),
              ],
            ),
            Spacer(),
            CircleAvatar(
              radius: 25.r,
              backgroundColor: Color(0XFFE7EEEB),
              child: SvgPicture.asset(
                height: 22.h,
                width: 22.w,
                'assets/icons/notification.svg',
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
