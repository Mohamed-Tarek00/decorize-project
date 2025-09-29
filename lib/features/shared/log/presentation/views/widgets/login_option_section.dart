import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginOptionsSection extends StatelessWidget {
  const LoginOptionsSection({
    super.key,
    required this.rememberMe,
    required this.onRememberMeChanged,
    required this.onForgotPassword,
  });

  final bool rememberMe;
  final VoidCallback onRememberMeChanged;
  final VoidCallback onForgotPassword;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.sp),
      child: Row(
        children: [
          GestureDetector(
            onTap: onRememberMeChanged,
            child: Container(
              padding: EdgeInsets.all(2.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: rememberMe ? kPrimaryColor : Colors.transparent,
                border: Border.all(
                  color: rememberMe ? Colors.transparent : Colors.grey,
                ),
              ),
              child: Icon(
                Icons.check,
                size: 18,
                color: rememberMe ? Colors.white : Colors.grey,
              ),
            ),
          ),
          SizedBox(width: 4.w),
          Text(
            'تذكرني',
            style: Styles.textStyle12.copyWith(
              color: rememberMe ? kPrimaryColor : Colors.grey,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: onForgotPassword,
            child: Column(
              children: [
                Text(
                  'هل نسيت كلمة المرور ؟',
                  style: Styles.textStyle12.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4.h),
                Container(color: Colors.black, width: 110.w, height: 1.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
