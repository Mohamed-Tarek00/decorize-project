import 'package:decorize_project/features/shared/auth/presentation/widgets/user_otp_auth_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class UserOtpAuth extends StatelessWidget {
  const UserOtpAuth({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      body: UserOtpAuthBody(email: email),
    );
  }
}
