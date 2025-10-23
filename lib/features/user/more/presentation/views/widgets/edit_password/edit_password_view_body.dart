import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/core/widgets/show_or_hide_pass.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPasswordViewBody extends StatefulWidget {
  const EditPasswordViewBody({super.key});

  @override
  State<EditPasswordViewBody> createState() => _EditPasswordViewBodyState();
}

class _EditPasswordViewBodyState extends State<EditPasswordViewBody> {
  bool oldObsecureText = false;
  bool newObsecureText = false;
  bool confirmObsecureText = false;
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        CustomAppBar(
          onTap: () {
            Navigator.pop(context);
          },
          headingText: 'تعديل كلمة المرور',
        ),

        Padding(
          padding: EdgeInsets.all(12.sp),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              children: [
                CustomTextFormField(
                  name: 'كلمة المرور القديمة',
                  hintText: 'ادخل كلمة المرور القديمة',
                  iconPath: 'assets/icons/lock.svg',
                  height: 50.h,
                  controller: oldPasswordController,
                  obscureText: oldObsecureText,

                  suffixIcon: ShowOrHidePass(
                    onToggle: () {
                      setState(() {
                        oldObsecureText = !oldObsecureText;
                      });
                    },
                    obsecureText: oldObsecureText,
                  ),
                ),
                CustomTextFormField(
                  name: 'كلمة المرور القديمة',
                  hintText: 'ادخل كلمة المرور القديمة',
                  iconPath: 'assets/icons/lock.svg',
                  height: 50.h,

                  controller: newPasswordController,
                  obscureText: newObsecureText,
                  suffixIcon: ShowOrHidePass(
                    onToggle: () {
                      setState(() {
                        newObsecureText = !newObsecureText;
                      });
                    },
                    obsecureText: newObsecureText,
                  ),
                ),
                CustomTextFormField(
                  name: 'كلمة المرور القديمة',
                  hintText: 'ادخل كلمة المرور القديمة',
                  iconPath: 'assets/icons/lock.svg',
                  height: 50.h,
                  controller: confirmPasswordController,
                  obscureText: confirmObsecureText,
                  suffixIcon: ShowOrHidePass(
                    onToggle: () {
                      setState(() {
                        confirmObsecureText = !confirmObsecureText;
                      });
                    },
                    obsecureText: confirmObsecureText,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
