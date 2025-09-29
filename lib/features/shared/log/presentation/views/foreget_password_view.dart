import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/shared/log/presentation/views/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';

class ForegetPasswordView extends StatelessWidget {
  const ForegetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        backgroundColor: kScaffoldColor,
        body: ForgetPasswordViewBody(),
      ),
    );
  }
}
