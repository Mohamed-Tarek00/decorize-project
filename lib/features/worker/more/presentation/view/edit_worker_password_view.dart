import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/edit_worker_password_view_body.dart';
import 'package:flutter/material.dart';

class EditWorkerPasswordView extends StatelessWidget {
  const EditWorkerPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: EditWorkerPasswordViewBody(),
    );
  }
}
