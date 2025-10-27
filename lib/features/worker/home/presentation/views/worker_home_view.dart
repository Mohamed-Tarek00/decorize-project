import 'package:decorize_project/core/utils/service_locator.dart';
import 'package:decorize_project/features/worker/home/domain/usecases/worker_jobs_usecase.dart';
import 'package:decorize_project/features/worker/home/presentation/cubits/worker_jobs_cubit/worker_jobs_cubit.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/home_widgets/worker_home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkerHomeView extends StatelessWidget {
  const WorkerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          WorkerJobsCubit(getIt.get<WorkerJobsUsecase>())..getJobs(),
      child: WorkerHomeViewBody(),
    );
  }
}
