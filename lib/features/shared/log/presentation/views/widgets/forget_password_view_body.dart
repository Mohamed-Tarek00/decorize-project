import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordViewBody extends StatefulWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  State<ForgetPasswordViewBody> createState() => _ForgetPasswordViewBodyState();
}

class _ForgetPasswordViewBodyState extends State<ForgetPasswordViewBody> {
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phone.dispose();
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
            Text('تسجيل الدخول', style: Styles.textStyle28),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: 'رقم الجوال',
              hintText: 'ادخل رقم الجوال',
              controller: _phone,
              iconPath: 'assets/icons/call.svg',
              validator: Validator.phoneValidator,
              textInputType: TextInputType.phone,
            ),
            SizedBox(height: 12.h),
            CustomButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.pushReplacement(
                    AppRouterNames.sendOtpView,
                    extra: _phone.text.trim(),
                  );
                }
              },
              text: 'إرسال',
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
