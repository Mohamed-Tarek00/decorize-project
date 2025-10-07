import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactFormSection extends StatefulWidget {
  const ContactFormSection({super.key});

  @override
  State<ContactFormSection> createState() => _ContactFormSectionState();
}

class _ContactFormSectionState extends State<ContactFormSection> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(12.sp),
              child: Text(
                'ارسال رسالة',
                style: Styles.textStyle18.copyWith(color: kPrimaryColor),
              ),
            ),
            CustomTextFormField(
              name: 'الاسم',
              hintText: 'ادخل الاسم',
              controller: nameController,
              iconPath: 'assets/icons/profile.svg',
            ),
            CustomTextFormField(
              name: 'الايميل',
              hintText: 'ادخل الايميل',
              controller: emailController,
              iconPath: 'assets/icons/sms.svg',
            ),
            CustomTextFormField(
              name: 'الوصف',
              hintText: 'ادخل الوصف',
              controller: descController,
              isDescription: true,
            ),
          ],
        ),
      ),
    );
  }
}
