import 'package:decorize_project/core/widgets/custom_app_bar.dart';
import 'package:decorize_project/core/widgets/show_or_hide_pass.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditPasswordViewBody extends StatefulWidget {
  const EditPasswordViewBody({
    super.key,
    required this.oldPasswordController,
    required this.newPasswordController,
    required this.confirmPasswordController,
  });
  final TextEditingController oldPasswordController;
  final TextEditingController newPasswordController;
  final TextEditingController confirmPasswordController;
  @override
  State<EditPasswordViewBody> createState() => _EditPasswordViewBodyState();
}

class _EditPasswordViewBodyState extends State<EditPasswordViewBody> {
  bool oldObsecureText = false;
  bool newObsecureText = false;
  bool confirmObsecureText = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
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
                    controller: widget.oldPasswordController,
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
                    name: 'كلمة المرور الجديدة',
                    hintText: 'ادخل كلمة المرور الجديدة',
                    iconPath: 'assets/icons/lock.svg',
                    height: 50.h,

                    controller: widget.newPasswordController,
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
                    name: 'تأكيد كلمة المرور',
                    hintText: 'اعد كتابة كلمة المرور الجديدة',
                    iconPath: 'assets/icons/lock.svg',
                    height: 50.h,
                    controller: widget.confirmPasswordController,
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
      ),
    );
  }
}
