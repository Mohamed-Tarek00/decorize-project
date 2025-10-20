part of 'worker_details_cubit.dart';

sealed class WorkerDetailsState extends Equatable {
  const WorkerDetailsState();

  @override
  List<Object> get props => [];
}

final class WorkerDetailsInitial extends WorkerDetailsState {}

final class WorkerDetailsLoading extends WorkerDetailsState {}

final class WorkerDetailsFailuer extends WorkerDetailsState {
  final String errMessage;

  const WorkerDetailsFailuer({required this.errMessage});
}

final class WorkerDetailsSuccess extends WorkerDetailsState {
  final WorkerDetailsEntity response;

  const WorkerDetailsSuccess({required this.response});
}
