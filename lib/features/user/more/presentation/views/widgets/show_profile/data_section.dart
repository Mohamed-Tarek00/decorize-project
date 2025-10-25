import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';

import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class DataSection extends StatelessWidget {
  const DataSection({
    super.key,
    required this.nameController,
    required this.phoneController,
  });
  final TextEditingController nameController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            CustomTextFormField(
              controller: nameController,
              name: 'الاسم',
              hintText: 'الاسم',
              readOnly: true,
              iconPath: 'assets/icons/profile.svg',
              height: 50.h,
            ),
            CustomTextFormField(
              controller: phoneController,
              name: 'رقم الجوال',
              hintText: 'رقم الجوال',
              readOnly: true,
              iconPath: 'assets/icons/phone.svg',
              height: 50.h,
            ),
            CustomTextFormField(
              name: 'كلمة المرور',
              hintText: '*********',
              readOnly: true,
              iconPath: 'assets/icons/lock.svg',
              height: 50.h,
              suffixIcon: GestureDetector(
                onTap: () {
                  context.push(AppRouterNames.editPasswordView);
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "تعديل",
                      style: Styles.textStyle14.copyWith(
                        color: kPrimaryColor,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1.25.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
