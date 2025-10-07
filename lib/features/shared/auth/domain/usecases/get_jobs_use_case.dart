import 'package:dartz/dartz.dart';
import 'package:decorize_project/core/errors/failure.dart';
import 'package:decorize_project/features/shared/auth/domain/entities/job.dart';
import 'package:decorize_project/features/shared/auth/domain/repositories/static_repo.dart';

class GetJobsUseCase {
  GetJobsUseCase(this.staticRepo);
  final StaticRepo staticRepo;
  Future<Either<Failure, List<Job>>> call() async {
    return await staticRepo.getJobs();
  }
}
