import 'package:decorize_project/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeTextField extends StatelessWidget {
  const OtpCodeTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4,
      keyboardType: TextInputType.number,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: kPrimaryColor,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 60,
        fieldWidth: 60,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Colors.white,
        activeColor: kPrimaryColor,
        selectedColor: kPrimaryColor,
        inactiveColor: Colors.grey.shade400,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: (value) {
        print("OTP Entered: $value");
      },
    );
  }
}
