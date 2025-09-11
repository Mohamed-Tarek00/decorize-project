import 'package:decorize_project/features/worker/home/presentation/views/widgets/worker_home_view_body.dart';
import 'package:flutter/material.dart';

class WorkerHomeView extends StatelessWidget {
  const WorkerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: WorkerHomeViewBody(),
    );
  }
}
