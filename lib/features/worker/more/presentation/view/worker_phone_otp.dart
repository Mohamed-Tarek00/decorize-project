import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_phone_otp_view_body.dart';
import 'package:flutter/material.dart';

class WorkerPhoneOtpView extends StatelessWidget {
  const WorkerPhoneOtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: WorkerPhoneOtpViewBody(),
    );
  }
}
