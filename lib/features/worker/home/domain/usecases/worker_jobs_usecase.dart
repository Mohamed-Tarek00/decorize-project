import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/worker/home/domain/entites/job_entity.dart';
import 'package:decorize_project/features/worker/home/domain/repos/job_repo.dart';

class WorkerJobsUsecase {
  final JobRepo jobRepo;

  WorkerJobsUsecase(this.jobRepo);

  Future<Either<Failure, List<WorkerJobEntity>>> call() async {
    return await jobRepo.getJobs();
  }
}
