import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_details_view_body.dart';
import 'package:flutter/material.dart';

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: JobDetailsViewBody(),
    );
  }
}
