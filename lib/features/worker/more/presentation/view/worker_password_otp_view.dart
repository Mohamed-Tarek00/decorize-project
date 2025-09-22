import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_password_otp_view_body.dart';
import 'package:flutter/material.dart';

class WorkerPasswordOtpView extends StatelessWidget {
  const WorkerPasswordOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: WorkerPasswordOtpViewBody(),
    );
  }
}
