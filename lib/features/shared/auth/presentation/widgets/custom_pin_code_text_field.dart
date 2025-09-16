import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: PinCodeTextField(
        appContext: context,
        length: 4,
        controller: otpController,
        keyboardType: TextInputType.number,
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
    );
  }
}
