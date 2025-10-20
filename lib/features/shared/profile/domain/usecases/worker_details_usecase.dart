import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/profile/domain/entities/worker_details_entity.dart';
import 'package:decorize_project/features/shared/profile/domain/repos/profile_repo.dart';

class WorkerDetailsUsecase {
  final ProfileRepo profileRepo;

  WorkerDetailsUsecase(this.profileRepo);

  Future<Either<Failure, WorkerDetailsEntity>> call(int workerId) async {
    return await profileRepo.getWorkerDetails(workerId: workerId);
  }
}
