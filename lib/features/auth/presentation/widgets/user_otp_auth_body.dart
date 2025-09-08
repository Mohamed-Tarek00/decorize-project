import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class UserOtpAuthBody extends StatefulWidget {
  const UserOtpAuthBody({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<UserOtpAuthBody> createState() => _UserOtpAuthBodyState();
}

class _UserOtpAuthBodyState extends State<UserOtpAuthBody> {
  final TextEditingController otpController = TextEditingController();
  String otpCode = '';

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
            Navigator.pop(context);
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
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {},
                  onCompleted: (value) {
                    otpCode = value;
                  },
                  enableActiveFill: true,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(12),
                    fieldHeight: 74,
                    fieldWidth: 74,
                    activeFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    activeColor: Colors.green,
                    selectedColor: Colors.green,
                    inactiveColor: Colors.grey.shade300,
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              CustomButton(
                onPressed: () {
                  print('تم الارسال');
                },
                text: 'ارسال',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
