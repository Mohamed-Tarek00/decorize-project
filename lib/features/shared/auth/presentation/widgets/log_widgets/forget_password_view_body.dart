import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/forget_password_button_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController email = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_forward_ios),
              ),
            ),
            Spacer(),
            Image.asset(kMainLogo, height: 80.h, width: 70.w),
            Text('هل نسيت كلمة المرور ؟', style: Styles.textStyle28),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: 'البريد الإلكتروني',
              hintText: 'ادخل البريد الإلكتروني',
              controller: email,
              iconPath: 'assets/icons/sms.svg',
              validator: Validator.emailValidator,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12.h),
            ForgetPasswordButtonSection(email: email, formKey: _formKey),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
