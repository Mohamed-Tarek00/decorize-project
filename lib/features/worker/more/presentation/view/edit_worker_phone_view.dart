import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/edit_worker_phone_body.dart';
import 'package:flutter/material.dart';

class EditWorkerPhoneView extends StatelessWidget {
  const EditWorkerPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: EditWorkerPhoneViewBody(),
    );
  }
}
