import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/shared/auth/domain/usecases/otp_verification_use_case.dart';
import 'package:decorize_project/features/shared/auth/presentation/cubits/otp_key/otp_key_cubit.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/otp_widgets/otp_auth_body.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class OtpAuth extends StatelessWidget {
  const OtpAuth({super.key, required this.email, required this.purpose});
  final String email;
  final String purpose;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpKeyCubit(getIt<OtpVerificationUseCase>()),
      child: Scaffold(
        backgroundColor: Color(0xfff5f5f5),
        body: OtpAuthBody(email: email, purpose: purpose),
      ),
    );
  }
}
