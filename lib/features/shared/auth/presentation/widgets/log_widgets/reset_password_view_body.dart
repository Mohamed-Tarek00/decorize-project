import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/reset_password_button_sectiion.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/register_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordViewBody extends StatefulWidget {
  const ResetPasswordViewBody({super.key});

  @override
  State<ResetPasswordViewBody> createState() => _ResetPasswordViewBodyState();
}

class _ResetPasswordViewBodyState extends State<ResetPasswordViewBody> {
  final TextEditingController _newPassword = TextEditingController();
  final TextEditingController _newPasswordConfirmation =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print('🔥 ResetPasswordViewBody initState');
    super.initState();
  }

  @override
  void dispose() {
    _newPassword.dispose();
    _newPasswordConfirmation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('✅ ResetPasswordViewBody build');
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(Icons.arrow_forward_ios),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Image.asset(kMainLogo, height: 80.h, width: 70.w),
            Text('إعادة تعيين كلمة المرور', style: Styles.textStyle28),
            SizedBox(height: 22.h),
            CustomTextFormField(
              name: 'كلمة المرور',
              hintText: 'ادخل كلمة المرور',
              controller: _newPassword,
              validator: Validator.passwordValidator,
            ),
            CustomTextFormField(
              name: 'تأكيد كلمة المرور ',
              hintText: 'ادخل كلمة المرور',
              controller: _newPasswordConfirmation,
              validator: Validator.passwordValidator,
            ),
            SizedBox(height: 12.h),
            ResetPasswordButtonSectiion(
              newPassword: _newPassword,
              newPasswordConfirmation: _newPasswordConfirmation,
              formKey: _formKey,
            ),
          ],
        ),
      ),
    );
  }
}
