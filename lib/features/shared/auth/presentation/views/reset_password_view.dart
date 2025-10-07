import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/shared/auth/presentation/widgets/log_widgets/reset_password_view_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        backgroundColor: kScaffoldColor,
        body: ResetPasswordViewBody(),
      ),
    );
  }
}
