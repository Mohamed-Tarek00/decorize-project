import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/utils/validator.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/custom_navigation_button.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:decorize_project/features/shared/log/presentation/views/widgets/login_option_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key, this.position, required this.role});
  final Position? position;
  final String? role;

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool remmberMe = false;

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(kMainLogo, height: 80.h, width: 70.w),
            Text('تسجيل الدخول', style: Styles.textStyle28),
            SizedBox(height: 20.h),
            CustomTextFormField(
              name: 'البريد الإلكتروني',
              hintText: 'ادخل البريد الإلكتروني',
              controller: email,
              iconPath: 'assets/icons/sms.svg',
              validator: Validator.emailValidator,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextFormField(
              name: 'كلمة المرور',
              hintText: 'ادخل كلمة المرور',
              controller: password,
              iconPath: 'assets/icons/lock.svg',
              validator: Validator.passwordValidator,
              textInputType: TextInputType.visiblePassword,
            ),
            LoginOptionsSection(
              rememberMe: remmberMe,
              onRememberMeChanged: () {
                setState(() {
                  remmberMe = !remmberMe;
                });
              },
              onForgotPassword: () =>
                  context.push(AppRouterNames.forgetPasswordView),
            ),
            SizedBox(height: 12.h),
            CustomButton(
              onPressed: () {
                context.go(AppRouterNames.workerBottomNavigation);
              },
              text: 'تسجيل الدخول',
            ),
            CustomNavigationButton(
              solidText: 'ليس لديك حساب  ؟ ',
              navigationText: 'إنشاء حساب',
              onPressed: () {
                context.pushReplacement(
                  AppRouterNames.registerView,
                  extra: {'type': widget.role, 'position': widget.position},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
