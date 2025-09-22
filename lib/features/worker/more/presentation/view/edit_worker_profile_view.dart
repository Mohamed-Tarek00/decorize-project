import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/edit_worker_profile_view_body.dart';
import 'package:flutter/material.dart';

class EditWorkerProfileView extends StatelessWidget {
  const EditWorkerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: EditWorkerProfileViewBody(),
    );
  }
}
