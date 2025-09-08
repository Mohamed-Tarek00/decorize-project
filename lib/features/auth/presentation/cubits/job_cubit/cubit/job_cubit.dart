import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/auth/domain/usecases/get_jobs_use_case.dart';
import 'package:decorize_project/features/auth/presentation/cubits/job_cubit/cubit/job_cubit_state.dart';

class JobCubit extends Cubit<JobState> {
  final GetJobsUseCase getJobsUseCase;

  JobCubit(this.getJobsUseCase) : super(JobInitial());

  Future<void> fetchJobs() async {
    emit(JobLoading());

    final result = await getJobsUseCase();

    result.fold(
      (failure) => emit(JobError(failure.toString())),
      (jobs) => emit(JobLoaded(jobs)),
    );
  }
}
