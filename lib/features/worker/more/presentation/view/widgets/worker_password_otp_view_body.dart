import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custom_worker_button.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/custome_bottomsheet.dart';
import 'package:decorize_project/core/widgets/otp_code_text_field.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/otp_instruction_text.dart';
import 'package:decorize_project/features/worker/my_orders/presentation/view/widgets/custom_worker_appbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerPasswordOtpViewBody extends StatelessWidget {
  const WorkerPasswordOtpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomWorkerAppbar(title: 'تغيير كلمة المرور'),
        SizedBox(height: 20.h),
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('إدخال رمز التأكيد', style: Styles.textStyle14),
              SizedBox(height: 8.h),
              const OtpInstructionsText(),
              SizedBox(height: 16.h),
              const OtpCodeTextField(),
              SizedBox(height: 12.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    children: [
                      TextSpan(
                        text: "لم يصلك الكود ؟ ",
                        style: Styles.textStyle12.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff67675C),
                        ),
                      ),
                      TextSpan(
                        text: " إعادة إرسال الكود",
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 12,
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          color: Colors.white,
          child: CustomWorkerButton(
            onTap: () {
              CustomBottomSheet.show(
                context,
                imagePath: 'assets/logo/success logo.svg',
                mainText: 'تم تغيير كلمة المرور بنجاح',
                bodyText:
                    'تم تغيير كلمة المرور الخاصه بك بك بنجاح يمكنك الان استخدام كلمة المرور الجديده',
              );
            },
            height: 40.h,
            width: double.infinity,
            text: 'إرسال',
            textStyle: Styles.textStyle14.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
