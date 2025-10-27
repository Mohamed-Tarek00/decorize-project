part of 'worker_jobs_cubit.dart';

sealed class WorkerJobsState extends Equatable {
  const WorkerJobsState();

  @override
  List<Object> get props => [];
}

final class WorkerJobsInitial extends WorkerJobsState {}

final class WorkerJobsLoading extends WorkerJobsState {}

final class WorkerJobsFailuer extends WorkerJobsState {
  final String errMessage;

  const WorkerJobsFailuer({required this.errMessage});
}

final class WorkerJobsLoaded extends WorkerJobsState {
  final List<WorkerJobEntity> response;

  const WorkerJobsLoaded({required this.response});
}
