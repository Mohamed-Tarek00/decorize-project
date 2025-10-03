import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/router/app_router_names.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:decorize_project/core/widgets/otp_code_text_field.dart';
import 'package:decorize_project/features/shared/log/domain/entities/forget_password_response_entity.dart';
import 'package:decorize_project/features/shared/log/domain/entities/user_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SendOrpViewBody extends StatelessWidget {
  const SendOrpViewBody({
    super.key,
    required this.user,
    required this.verficationCode,
  });
  final UserEntity user;
  final String verficationCode;
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Text('إدخال رمز التفعيل', style: Styles.textStyle28),
        SizedBox(height: 32.h),
        OtpCodeTextField(),
        SizedBox(height: 12.h),
        CustomButton(
          onPressed: () {
            context.pushReplacement(AppRouterNames.resetPasswordView);
          },
          text: 'إرسال',
        ),
        Spacer(flex: 2),
      ],
    );
  }
}
