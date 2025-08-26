import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/userregisterview/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserRegisterViewBody extends StatefulWidget {
  const UserRegisterViewBody({super.key});

  @override
  State<UserRegisterViewBody> createState() => _UserRegisterViewBodyState();
}

class _UserRegisterViewBodyState extends State<UserRegisterViewBody> {
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kMainLogo, height: 80.h, width: 70.w),
            Text('انشاء حساب', style: Styles.textStyle28),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: 'الاسم',
              hintText: 'ادخل الاسم',
              iconPath: 'assets/icons/profile.svg',
            ),
            CustomTextFormField(
              name: 'البريد الإلكتروني',
              hintText: 'ادخل البريد الإلكتروني',
              iconPath: 'assets/icons/sms.svg',
            ),
            CustomTextFormField(
              name: 'كلمة المرور',
              hintText: 'ادخل كلمة المرور',
              iconPath: 'assets/icons/lock.svg',
            ),
            CustomTextFormField(
              name: 'تأكيد كلمة المرور',
              hintText: 'ادخل كلمة المرور',
              iconPath: 'assets/icons/lock.svg',
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isAgreed = !isAgreed;
                      });
                    },
                    child: SvgPicture.asset(
                      'assets/icons/tick-square.svg',
                      width: 20.w,
                      height: 20.h,
                      color: isAgreed ? Colors.blue : Colors.grey,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'الموافقة على الشروط والأحكام',
                    style: Styles.textStyle14,
                  ),
                ],
              ),
            ),
            CustomButton(onPressed: () {}, text: 'انشاء حساب'),
          ],
        ),
      ),
    );
  }
}
