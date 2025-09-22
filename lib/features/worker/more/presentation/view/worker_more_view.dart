import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/more/presentation/view/widgets/worker_more_view_body.dart';
import 'package:flutter/material.dart';

class WorkerMoreView extends StatelessWidget {
  const WorkerMoreView({super.key, this.onBackToHome});
  final VoidCallback? onBackToHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: WorkerMoreViewBody(onBackToHome: onBackToHome),
    );
  }
}
