import 'package:decorize_project/features/worker/home/presentation/views/widgets/job_request_card.dart';
import 'package:flutter/material.dart';

class JobList extends StatelessWidget {
  const JobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return const JobRequestCard();
        },
      ),
    );
  }
}
