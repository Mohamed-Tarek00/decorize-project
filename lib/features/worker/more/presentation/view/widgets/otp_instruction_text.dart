import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtpInstructionsText extends StatelessWidget {
  const OtpInstructionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.right,
      text: TextSpan(
        style: const TextStyle(fontSize: 14, color: Colors.black, height: 1.5),
        children: [
          const TextSpan(
            text:
                "لتأكيد حسابك قم بإدخال الكود المكون من 4 أرقام الذي تم ارساله في رسالة إلى رقم الهاتف ",
          ),
          TextSpan(
            text: "252 --- --- --- ---",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(text: " (", style: Styles.textStyle14),
          TextSpan(
            text: "تغيير الرقم",
            style: const TextStyle(
              color: kPrimaryColor,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          const TextSpan(text: "), سيصلك الكود خلال "),
          TextSpan(
            text: "01:30",
            style: Styles.textStyle14.copyWith(
              fontWeight: FontWeight.bold,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
