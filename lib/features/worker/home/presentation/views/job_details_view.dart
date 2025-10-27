import 'package:decorize_project/core/constants.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_widgets/job_details_view_body.dart';
import 'package:flutter/material.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key, required this.job});
  final WorkerJobEntity job;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: JobDetailsViewBody(job: job),
    );
  }
}
