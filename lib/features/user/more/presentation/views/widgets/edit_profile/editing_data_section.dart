import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EditingDataSection extends StatefulWidget {
  const EditingDataSection({super.key});

  @override
  State<EditingDataSection> createState() => _EditingDataSectionState();
}

class _EditingDataSectionState extends State<EditingDataSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.sp),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          children: [
            CustomTextFormField(
              name: 'الاسم',
              hintText: 'احمد محمد',
              readOnly: true,
              iconPath: 'assets/icons/profile.svg',
              height: 50.h,
            ),
            CustomTextFormField(
              name: 'رقم الجوال',
              hintText: '+966 25676461668',
              readOnly: true,
              iconPath: 'assets/icons/phone.svg',
              height: 50.h,
              suffixIcon: Column(
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
            CustomTextFormField(
              name: 'كلمة المرور',
              hintText: '***************',
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
