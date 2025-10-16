import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/otp_widgets/custom_pin_code_text_field.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/otp_widgets/send_otp_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class OtpAuthBody extends StatefulWidget {
  const OtpAuthBody({super.key, required this.email, required this.purpose});
  final String email;
  final String purpose;

  @override
  State<OtpAuthBody> createState() => _OtpAuthBodyState();
}

class _OtpAuthBodyState extends State<OtpAuthBody> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: const Color(0xfff5f5f5),
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(
            'assets/icons/arrow-right.svg',
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(kMainLogo, height: 80.h, width: 70.w),
              SizedBox(height: 16.h),
              Text('إدخال رمز التفعيل', style: Styles.textStyle20),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: CustomPinCodeTextField(otpController: otpController),
              ),
              SizedBox(height: 24.h),
              SendOtpKey(
                otpController: otpController,
                email: widget.email,
                purpose: widget.purpose,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
