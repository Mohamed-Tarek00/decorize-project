import 'package:bloc/bloc.dart';
import 'package:decorize_project/features/shared/profile/domain/entities/worker_details_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/usecases/worker_details_usecase.dart';
import 'package:equatable/equatable.dart';

part 'worker_details_state.dart';

class WorkerDeetailsCubit extends Cubit<WorkerDetailsState> {
  final WorkerDetailsUsecase workerProfileUsecase;
  WorkerDeetailsCubit(this.workerProfileUsecase)
    : super(WorkerDetailsInitial());

  Future<void> getWorkerProfile({required int workerId}) async {
    emit(WorkerDetailsLoading());

    final result = await workerProfileUsecase.call(workerId);

    result.fold(
      (failuer) => emit(WorkerDetailsFailuer(errMessage: failuer.errorMessage)),
      (response) => emit(WorkerDetailsSuccess(response: response)),
    );
  }
}
