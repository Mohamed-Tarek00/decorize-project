import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/home_widgets/job_request_card.dart';
import 'package:flutter/material.dart';

class JobsList extends StatelessWidget {
  const JobsList({super.key, required this.jobs});
  final List<WorkerJobEntity> jobs;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: jobs.length,
      itemBuilder: (context, index) => JobRequestCard(job: jobs[index]),
    );
  }
}
