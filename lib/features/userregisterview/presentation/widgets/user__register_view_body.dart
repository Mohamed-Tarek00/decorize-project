import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/userregisterview/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserRegisterViewBody extends StatelessWidget {
  const UserRegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(kMainLogo, height: 80.h, width: 70.w),
          Text('انشاء حساب', style: Styles.textStyle28),
          SizedBox(height: 20.h),
          CustomTextFormField(),
        ],
      ),
    );
  }
}
