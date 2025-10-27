import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/domain/usecases/worker_jobs_usecase.dart';
import 'package:equatable/equatable.dart';

part 'worker_jobs_state.dart';

class WorkerJobsCubit extends Cubit<WorkerJobsState> {
  final WorkerJobsUsecase workerJobsUsecase;
  WorkerJobsCubit(this.workerJobsUsecase) : super(WorkerJobsInitial());

  Future<void> getJobs() async {
    print('🚀 loadJobs started');

    emit(WorkerJobsLoading());
    final result = await workerJobsUsecase.call();
    result.fold(
      (failuer) {
        print('❌ Failure: ${failuer.errorMessage}');

        emit(WorkerJobsFailuer(errMessage: failuer.errorMessage));
      },
      (response) {
        print('🎉 Success: ${response.length} jobs loaded');

        emit(WorkerJobsLoaded(response: response));
      },
    );
  }
}
