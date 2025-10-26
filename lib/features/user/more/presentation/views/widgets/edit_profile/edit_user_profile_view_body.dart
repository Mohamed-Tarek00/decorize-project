import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/user/more/presentation/views/widgets/show_profile/change_picture_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserProfileViewBody extends StatefulWidget {
  const EditUserProfileViewBody({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.formKey,
  });
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final GlobalKey<FormState> formKey;

  @override
  State<EditUserProfileViewBody> createState() =>
      _EditUserProfileViewBodyState();
}

class _EditUserProfileViewBodyState extends State<EditUserProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            CustomAppBar(
              onTap: () {
                Navigator.pop(context);
              },
              headingText: 'تعديل الملف الشخصي',
            ),
            SizedBox(height: 10.h),
            ChangePictureSection(),

            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: widget.nameController,
                      name: 'الاسم',
                      hintText: 'الاسم',
                      iconPath: 'assets/icons/profile.svg',
                      height: 50.h,
                      validator: Validator.nameValidator,
                    ),
                    CustomTextFormField(
                      controller: widget.phoneController,
                      name: 'رقم الجوال',
                      hintText: 'رقم الجوال',
                      iconPath: 'assets/icons/phone.svg',
                      height: 50.h,
                      validator: Validator.phoneValidator,
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
