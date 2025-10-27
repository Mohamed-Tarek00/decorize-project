import 'package:decorize_project/core/widgets/failuer_snackbar.dart';
import 'package:decorize_project/features/worker/home/presentation/cubits/worker_jobs_cubit/worker_jobs_cubit.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/home_widgets/job_request_card_loading.dart';
import 'package:decorize_project/features/worker/home/presentation/views/widgets/home_widgets/jobs_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobsSection extends StatelessWidget {
  const JobsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkerJobsCubit, WorkerJobsState>(
      listener: (context, state) {
        if (state is WorkerJobsFailuer) {
          SnackBarHelper.showFailure(context, message: state.errMessage);
        }
      },
      builder: (context, state) {
        if (state is WorkerJobsLoading) {
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) => const JobRequestCardLoading(),
          );
        } else if (state is WorkerJobsLoaded) {
          final jobs = state.response;
          return JobsList(jobs: jobs);
        } else if (state is WorkerJobsFailuer) {
          return Center(child: Text(state.errMessage));
        } else {
          return const Center(child: Text('حدث خطأ أثناء تحميل البيانات'));
        }
      },
    );
  }
}
